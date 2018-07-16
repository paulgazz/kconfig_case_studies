let fs              = require('fs')
let path            = require('path')
let find            = require('find')
let lbl             = require('line-by-line');
let async           = require('async');

let working_dir     = "./"
let err_name        = /cppcheck_resolved\.txt$/
// let err_name        = /cppcheck\.resolved$/

function findAllErrorFiles(callback){
    find.file(err_name, working_dir, function(files) {
        return callback(null, files)
    })
    .error(function(err) {
        return callback(err);
    });
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
 * 
 * @param {Boolean} unique 
 * 
 * Counts the number of bugs in the found across all configs and 
 * generates a report in the form of a JSON
 * 
 * Pass in argument of true to collect only unique occurences of a bug throughout all configs
 */
function buildReport(name, unique){
    let report = { max:0, min:999999999999};
    findAllErrorFiles(function(err, files){
        if(err) return err;
        //iterate over all the files, only process 5 at a time to prevent i/o explosion
        async.forEachLimit(files, 5, function(file, callback) {
            console.log("processing " + file)
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

buildReport("report_unique.json", true)
buildReport("report.json", false)
