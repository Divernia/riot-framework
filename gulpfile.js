'use strict';

/* gulpfile.js */

// Load some modules which are installed through NPM.
var gulp = require('gulp');
var connect = require('gulp-connect');
var browserify = require('browserify'); // Bundles JS.
var del = require('del'); // Deletes files.
var riotify = require('riotify');
var source = require('vinyl-source-stream');

// Define some paths.
var paths = {
  app_js: ['./src/main.js'],
  js: ['src/*.js'],
  tag: ['src/*.tag']
};

// Start server
gulp.task('webserver', function() {
  connect.server();
});

// Clean build dir
gulp.task('clean', function(done) {
  del(['build'], done);
});

// Our build task. It will Browserify our code and compile Riot files.
gulp.task('build', ['clean'], function() {
  // Browserify/bundle the JS.
  browserify(paths.app_js)
    .transform(riotify)
    .bundle()
    .pipe(source('bundle.js'))
    .pipe(gulp.dest('./dist/'));
});

// Rerun tasks whenever a file changes.
gulp.task('watch', function() {
  gulp.watch(paths.js, ['build']);
  gulp.watch(paths.tag, ['build']);
});

// The default task (called when we run `gulp` from cli)
gulp.task('default', ['build', 'webserver', 'watch']);

