'use strict';

var gulp        = require('gulp');
var notify      = require('gulp-notify');
var plumber     = require('gulp-plumber');
var require_dir = require('require-dir');
var rev_all     = require('gulp-rev-all');
var sourcemaps  = require('gulp-sourcemaps');
var util        = require('gulp-util');

function handleError(error) {
  util.log(error.toString());

  notify({
    message: error
  });

  this.emit('end');
}

function is_production() {
  return undefined != util.env.rails_env && (util.env.rails_env = 'production')
}

var config = {
  paths: {
    javascripts: {
      files: {
        any:    'app/assets/javascripts/**/*.js',
        inputs: [
          'app/assets/javascripts/application.js',
          'app/assets/javascripts/code_club.js'
        ]
      },
      dest: 'public/assets/javascripts'
    },
    stylesheets: {
      files: {
        any:    'app/assets/stylesheets/**/*.scss',
        inputs: [
          'app/assets/stylesheets/application.scss',
          'app/assets/stylesheets/code_club.scss'
        ]
      },
      dest: 'public/assets/stylesheets'
    }
  }
};

gulp.task('javascripts', function () {
  var babel  = require("gulp-babel");
  var uglify = require('gulp-uglify');

  var files  = config.paths.javascripts.files;
  var stream = gulp.src(files.inputs)
    .pipe(plumber({
      errorHandler: handleError
    }))
    .pipe(sourcemaps.init())
    .pipe(babel({
      presets: ['es2015']
    }));

  if (is_production()) {
    stream = stream.pipe(uglify());
  }

  stream.pipe(sourcemaps.write('.'))
    .pipe(gulp.dest(config.paths.javascripts.dest))
    .on('error', handleError);

  return stream;
});

gulp.task('stylesheets', function () {
  var autoprefixer = require('gulp-autoprefixer');
  var minify_css   = require("gulp-minify-css");
  var sass         = require('gulp-sass');

  var files  = config.paths.stylesheets.files;
  var stream = gulp.src(files.inputs)
    .pipe(plumber({
      errorHandler: handleError
    }))
    .pipe(sourcemaps.init())
    .pipe(sass())
    .pipe(autoprefixer());

  if (is_production()) {
    stream = stream.pipe(minify_css());
  }

  stream.pipe(sourcemaps.write('.'))
    .pipe(gulp.dest(config.paths.stylesheets.dest))
    .on('error', handleError);

  return stream;
});

gulp.task('watch', function () {
  gulp.watch(config.paths.javascripts.files.any, ['javascripts']);
  gulp.watch(config.paths.stylesheets.files.any, ['stylesheets']);
});

gulp.task('default', [
  'stylesheets',
  'javascripts'
]);
