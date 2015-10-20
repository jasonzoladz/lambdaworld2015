var gulp = require("gulp");
var purescript = require("gulp-purescript");
var run = require('gulp-run');

var sources = [
  "src/**/*.purs",
  "bower_components/purescript-*/src/**/*.purs",
];

var foreigns = [
  "src/**/*.js",
  "bower_components/purescript-*/src/**/*.js"
];

gulp.task("make", function () {
  return purescript.psc({ src: sources, ffi: foreigns });
});

gulp.task("bundle", ["make"], function () {
  return purescript.pscBundle({ src: "output/**/*.js", module: "Main" , output: "dist/bundle.js" });
});

gulp.task("dotpsci", function () {
  return purescript.psci({ src: sources, ffi: foreigns })
    .pipe(gulp.dest("."));
});

gulp.task("test", ["make"], function() {
  return purescript.pscBundle({ src: "output/**/*.js", main: "Test.Main" })
    .pipe(run("node"));
});

gulp.task("default", ["bundle", "dotpsci", "test"]);
