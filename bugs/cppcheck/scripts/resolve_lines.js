// This program takes the cppcheck_all.txt results from each
// configuration and resolves the preprocessed line numbers back to
// their line numbers from the original .c and .h files.
//
// This script should be run in the parent directory of the
// configuration-specific directories.  Each first-level subdirectory
// should contain a file called cppcheck_all.txt containing the error
// output from cppcheck.

let fs              = require('fs')
let path            = require('path')
let find            = require('find')
let lbl             = require('line-by-line');
let async           = require('async');

let working_dir     = "./"
let err_name        = /\.cppcheck$/

function findAllErrorFiles(callback){
    find.file(err_name, working_dir, function(files) {
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
        if (line.startsWith('[')) {  // only include error lines
            lines.push(line);
        }
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
    let total = lines.length
    let i = 0
    process.stderr.write('\n')
    async.forEachOf(lines, function (line, key, each_callback) {
        i = i + 1
        process.stderr.write('\b\rline ' + i + ' of ' + total + '\n');
        let pre_processed = getStringMatch(line, /\w*.i\b/)
        let c_file = pre_processed.replace(".i", ".c");
        let line_num = getStringMatch(line, /\:\b\d*\b/).slice(1);
        let file_array = find.fileSync(new RegExp(pre_processed + "$"),directory);
        if(empty(file_array)){
            return each_callback();
        }
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
    find
    .file(new RegExp(filename), working_dir, function(files) {
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
    process.stderr.write("writing results to " + dest + '\n');
    fs.writeFile(dest, arr.join('\r\n'), function(err) {
        if(err) {
            console.log(err)
            return callback(err);
        }
        callback(null, dest);
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
            process.stderr.write("processing " + file + "\n")
            collectFileLines(file, function(err, lines){
                if(err) return callback();
                //get the parent folder of the error file
                let dir = './'
                //process lines accordingly
                processLines(lines, dir, function(err, result){
                    if(err) return callback();
                    result = result.sort();
                    //write the corrected lines to a new file
                    let output_file = file + '.resolved'
                    writeArrayToFile(result, dir, output_file, function(err, result){
                        if(err) {
                            process.stderr.write("error writing file\n");
                            return callback();
                        }
                        process.stderr.write("Saved data to " + result + '\n')
                        callback();
                    });
                })
            })
        }, function(err) {
            if (err) return next(err);
            process.stderr.write("All done\n");
        });
    });
}

lineCheck();
