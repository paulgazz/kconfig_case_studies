let fs              = require('fs')
let path            = require('path')
let find            = require('find')
let lbl             = require('line-by-line');
let async           = require('async');
let err_name        = /err_c\.txt$/

function findAllErrorFiles(callback){
    find.file(err_name, __dirname, function(files) {
        return callback(null, files)
    })
    .error(function(err) {
        return callback(err);
    });
}

function empty(mixedVar) {
    let undef
    let key
    let i
    let len
    let emptyValues = [undef, null, false, 0, '', '0']

    for (i = 0, len = emptyValues.length; i < len; i++) {
        if (mixedVar === emptyValues[i]) {
            return true;
        }
    }

    if (typeof mixedVar === 'object') {
        for (key in mixedVar) {
            if (mixedVar.hasOwnProperty(key)) {
                return false;
            }
        }
        return true;
    }
    return false;
}

function collectFileLines(f, callback){
    let e_file = new lbl(f);
    let lines = [];
    e_file.on('err', function(err){
        callback(err);
    });
    e_file.on('line', function(line){
        lines.push(line);
    });
    e_file.on('end', function(){
        callback(null, lines);
    });
}

function getOriginalLineNum(f, num, callback){
    let pre_file = new lbl(f);
    let latest;
    let count = 0;
    let diff_count = 0;
    pre_file.on('err', function(err){
        callback(err);
    });
    pre_file.on('line', function(line){
        count = count + 1;
        let check = line.match(/\# \d*\b/);
        if(count >= num){
            pre_file.close();
        }
        else if(!empty(check)){
            diff_count = count;
            latest = parseInt(check[0].slice(1));
        }
    });
    pre_file.on('end', function(){
        latest = latest + ( (num - diff_count) - 1);
        callback(null, latest)
    });
}

function processLines(lines, directory, callback){
    let new_lines = [];
    async.forEachOf(lines, function (line, key, each_callback) {
        let pre_processed = getStringMatch(line, /\w*.i\b/)
        let c_file = pre_processed.replace(".i", ".c");
        let line_num = getStringMatch(line, /\:\b\d*\b/).slice(1);
        let file_array = find.fileSync(new RegExp(pre_processed),directory);
        if(empty(file_array)){
            return each_callback();
        }
        //console.log('----------');
        //console.log(file_array[0]);
        getOriginalLineNum(file_array[0], line_num, function(err, original_line_num){
            if(err){
                return each_callback();
            }
            line = line.replace(/\b\w*\.i:\d*/, c_file + ":" + original_line_num);
            new_lines.push(line);
            each_callback();
        });
    }, function (err) {
        if (err) console.error(err.message);
        //finished iterating over the files
        return callback(null, new_lines);
    });
}

function getStringMatch(line, pattern){
    let match = line.match(pattern);
    try {
        let result = match[0];
        return result;
    } catch (error) {
        return -1;
    }
}

function findOriginalFile(filename, callback){
    //console.log(new RegExp(filename));
    find
    .file(new RegExp(filename), __dirname, function(files) {
        if(empty(files)){
            return callback("no files found");
        }
        callback(null, files)
    })
    .error(function(err) {
        return callback(err);
    });
}

function writeArrayToFile(arr, directory, file_name, callback){
    let dest = path.join(directory, file_name);
    fs.writeFile(dest, arr.join('\r\n'), function(err) {
        if(err) {
            return callback(err);
        }
        callback(null, dest);
    });
}

function countErrorLines(lines, report, unique, callback){
    let previous = [];
    async.forEachOf(lines, function (line, key, each_callback) {
        //increase the count for the number of times we have encountered this bug, if never seen before, assign 1
        if(unique){
            if(previous.indexOf(line) == -1){
                previous.push(line);
                report[line] = (!isNaN(report[line])) ? report[line] + 1 : 1
            }
        }
        else{
            report[line] = (!isNaN(report[line])) ? report[line] + 1 : 1
        }
        each_callback();
    }, function (err) {
        if (err) console.error(err.message);
        //finished iterating over the files
        return callback(null, report);
    });
}

/**
 * lineCheck is the function that detects all the cppcheck err.txt files, then
 * iterates over all of them, and corrects each line so that they contain the
 * name of the original c file and original line number of the bug
 */
function lineCheck(){
    //find all the 'err.txt' files
    findAllErrorFiles(function(err, files){
        if(err) return err;
        //iterate over all the files, only process 5 at a time to prevent i/o explosion
        async.forEachLimit(files, 5, function(file, callback) {
            //return a list of the lines in the file
            collectFileLines(file, function(err, lines){
                if(err) return callback();
                //get the parent folder of the error file
                let dir = path.dirname(file);
                //process lines accordingly
                processLines(lines, dir, function(err, result){
                    if(err) return callback();
                    result = result.sort();
                    console.log(dir);
                    console.log(result);
                    //write the corrected lines to a new file
                    writeArrayToFile(result, dir, "err_c.txt", function(err, result){
                        if(err) return callback();
                        console.log("Saved data to ", result)
                        callback();
                    });
                })
            })
        }, function(err) {
            if (err) return next(err);
            console.log("All done");
        });
    });
}

/**
 * 
 * @param {Boolean} unique 
 * 
 * Counts the number of bugs in the found across all configs and 
 * generates a report in the form of a JSON
 * 
 * Pass in argument of true to collect only unique occurences of a bug throughout all configs
 */
function buildReport(unique = false){
    let report = { max:0, min:999999999999};
    findAllErrorFiles(function(err, files){
        if(err) return err;
        //iterate over all the files, only process 5 at a time to prevent i/o explosion
        async.forEachLimit(files, 5, function(file, callback) {
            //return a list of the lines in the file
            collectFileLines(file, function(err, lines){
                if(err) return callback();
                if(lines.length == 0) return callback();
                if(lines.length < report['min']){
                    report['min'] = lines.length
                    report['min_file'] = file;
                }
                else if(lines.length > report['max']){
                    report['max'] = lines.length
                    report['max_file'] = file;
                } 
                //process lines accordingly
                countErrorLines(lines, report, unique, function(err, result){
                    report = result;
                    return callback();
                })
            })
        }, function(err) {
            if (err) return next(err);
            let name = "report.json";
            if(unique){
                name = "report_unique.json";
            }
            //write the report to file once done
            fs.writeFile(name, JSON.stringify(report), 'utf8', function (err) {
                if (err) {
                    console.log("An error occured while writing JSON Object to File.");
                    return console.log(err);
                }
                console.log(report);
                console.log("All done");
            });
        });
    });
}

//Uncomment to run script that corrects the err.txt files
//lineCheck();

//Uncomment to run function that counts the number of unique bugs in the program
buildReport(true)