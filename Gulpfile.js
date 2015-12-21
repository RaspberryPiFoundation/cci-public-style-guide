/*
  Specifying the production environment:

    gulp --rails_env=production
*/

'use strict';

//  Load generic node stuff
var exec   = require('child_process').exec;
var reload = require('require-reload')(require);

//  Load package.json as JSON object
var pkg  = require('./package.json');

//  Load Gulp Dependencies
var gulp       = require('gulp');
var header     = require('gulp-header');
var notify     = require('gulp-notify');
var plumber    = require('gulp-plumber');
var rename     = require('gulp-rename');
var sourcemaps = require('gulp-sourcemaps');
var util       = require('gulp-util');



//  Set banner template
var banner = ['/**',
  ' * <%= dest_file %>',
  ' * ',
  ' * <%= pkg.friendly_name %> - <%= pkg.description %>',
  ' * @version v<%= pkg.version %>',
  ' * @link <%= pkg.homepage %>',
  ' */',
  ''].join('\n');



//  Set website assets configuration
var app_assets_config = {
  fonts: {
    source:    'app/assets/fonts/**/*',
    dest_dir:  'public/assets/fonts'
  },
  images: {
    source:    'app/assets/images',
    dest_dir:  'public/assets/images'
  },
  javascripts: {
    source:    'app/assets/javascripts',
    main:      'application.js',
    dest_dir:  'public/assets/javascripts',
    dest_file: 'application.js',
    min_file:  'application.min.js'
  },
  stylesheets: {
    source:    'app/assets/stylesheets',
    main:      'application.scss',
    dest_dir:  'public/assets/stylesheets',
    dest_file: 'application.css',
    min_file:  'application.min.css'
  }
};

//  Set style guide assets configuration
var cc_assets_config = {
  fonts: {
    source:    'app/assets/code_club/fonts/**/*',
    dest_dir:  'public/assets/code_club/fonts'
  },
  images: {
    source:    'app/assets/code_club/images',
    dest_dir:  'public/assets/code_club/images'
  },
  javascripts: {
    source:    'app/assets/code_club/javascripts',
    main:      'code_club.js',
    dest_dir:  'public/assets/code_club/javascripts',
    dest_file: 'code_club.js',
    min_file:  'code_club.min.js'
  },
  stylesheets: {
    source:    'app/assets/code_club/stylesheets',
    main:      'code_club.scss',
    dest_dir:  'public/assets/code_club/stylesheets',
    dest_file: 'code_club.css',
    min_file:  'code_club.min.css'
  }
};

//  Set `dist` source and destination
var dist_dirs = {
  source: "./public/assets/code_club/**/*",
  dest:   "./dist/"
};



//  Utility functions
function handleError(error) {
  util.log(error.toString());

  notify({
    message: error
  });

  return this.emit('end');
}

function progress(message, file) {
  if (undefined !== file) {
    message = file + ' - ' + message;
  }

  return util.log('- ' + message);
}



//  Master font compilation function
function process_fonts(config) {
  var stream = gulp.src(config.source)
    .pipe(gulp.dest(config.dest_dir)).on('end', function () {
      progress('Copied fonts');
    });

  return stream;
}



//  Master Images processing function
function process_images(config) {
  var imagemin = require('gulp-imagemin');
  var pngquant = require('imagemin-pngquant');

  var dest_dir = config.dest_dir;

  var stream = gulp.src(config.source + '/**/*')
    .pipe(plumber({
      errorHandler: handleError
    })).on('end', function () {
      progress(config.source + ' - Begin image compression');
    });

  stream = stream.pipe(imagemin({
    progressive: true,
    svgoPlugins: [{
      removeViewBox: false
    }],
    use: [
      pngquant()
    ]
  })).on('end', function () {
    progress(config.dest_dir + ' - Images compressed');
  });

  stream = stream.pipe(gulp.dest(dest_dir)).on('end', function () {
    progress('Writing files to ' + dest_dir);
  }).on('error', handleError);

  return stream;
}



//  Master JavaScript processing function
function process_javascripts(config, minify) {
  if (undefined === minify) {
    minify = false;
  }

  var babel  = require('gulp-babel');
  var uglify = require('gulp-uglify');

  var main     = config.main;
  var dest_dir = config.dest_dir;

  var stream = gulp.src(config.source + '/' + main)
    .pipe(plumber({
      errorHandler: handleError
    })).on('end', function () {
      progress('Begin Compilation', main);
    });

  stream = stream.pipe(sourcemaps.init()).on('end', function () {
    progress('Init Sourcemap', main);
  });

  stream = stream.pipe(babel({
    presets: ['es2015']
  })).on('end', function () {
    progress('Transpiling ES6', main);
  });

  if (minify) {
    stream = stream.pipe(uglify()).on('end', function () {
      progress('Uglifying', main);
    });

    stream = stream.pipe(rename({ extname: '.min.js' })).on('end', function () {
      progress('Renaming file', main);
    });
  }

  stream = stream.pipe(header(banner, {
    dest_file: minify ? config.min_file : config.dest_file,
    pkg:       pkg
  })).on('end', function () {
    progress('Creating banner', main);
  });

  stream = stream.pipe(sourcemaps.write('.')).on('end', function () {
    progress('Generating Sourcemap', main);
  });

  stream = stream.pipe(gulp.dest(dest_dir)).on('end', function () {
    progress('Writing file to ' + dest_dir, main);
    notify(main + ' compiled');
  }).on('error', handleError);

  if (!minify) {
    stream = process_javascripts(config, true);
  }

  return stream;
}



//  Master Stylesheet processing function
function process_stylesheets(config, minify) {
  if (undefined === minify) {
    minify = false;
  }

  var autoprefixer = require('gulp-autoprefixer');
  var minify_css   = require('gulp-minify-css');
  var sass         = require('gulp-sass');

  var main      = config.main;
  var dest_dir  = config.dest_dir;

  var stream = gulp.src(config.source + '/' + main)
    .pipe(plumber({
      errorHandler: handleError
    })).on('end', function () {
      progress('Begin Compilation', main);
    });

  stream = stream.pipe(sourcemaps.init()).on('end', function () {
    progress('Init Sourcemap', main);
  });

  stream = stream.pipe(sass()).on('end', function () {
    progress('Compile Sass', main);
  });

  stream = stream.pipe(autoprefixer()).on('end', function () {
    progress('Autoprefixing', main);
  });

  if (minify) {
    stream = stream.pipe(minify_css()).on('end', function () {
      progress('Minifying Compiled Styles', main);
    });

    stream = stream.pipe(rename({ extname: '.min.css' })).on('end', function () {
      progress('Renaming file', main);
    });
  }

  stream = stream.pipe(header(banner, {
    dest_file: minify ? config.min_file : config.dest_file,
    pkg:       pkg
  })).on('end', function () {
    progress('Creating banner', main);
  });

  stream = stream.pipe(sourcemaps.write('.')).on('end', function () {
    progress('Generating Sourcemap', main);
  });

  stream = stream.pipe(gulp.dest(dest_dir)).on('end', function () {
    progress('Writing file to ' + dest_dir, main);
  }).on('error', handleError);

  if (!minify) {
    stream = process_stylesheets(config, true);
  }

  return stream;
}



//  Application assets tasks
gulp.task('app_fonts',       function () { return process_fonts(app_assets_config.fonts);             });
gulp.task('app_images',      function () { return process_images(app_assets_config.images);           });
gulp.task('app_javascripts', function () { return process_javascripts(app_assets_config.javascripts); });
gulp.task('app_stylesheets', function () { return process_stylesheets(app_assets_config.stylesheets); });

gulp.task('app_assets', [
  'app_images',
  'app_javascripts',
  'app_stylesheets'
], function (callback) {
  callback();
});



//  Style guide assets tasks
gulp.task('cc_fonts',       function () { return process_fonts(cc_assets_config.fonts);             });
gulp.task('cc_images',      function () { return process_images(cc_assets_config.images);           });
gulp.task('cc_javascripts', function () { return process_javascripts(cc_assets_config.javascripts); });
gulp.task('cc_stylesheets', function () { return process_stylesheets(cc_assets_config.stylesheets); });

gulp.task('cc_assets', [
  'cc_fonts',
  'cc_images',
  'cc_javascripts',
  'cc_stylesheets'
]);

//  ALL assets
gulp.task('all_assets', [
  'app_assets',
  'cc_assets'
]);



//  Release tasks
gulp.task('bump_version_number', function () {
  var bump = require('gulp-bump');

  var release_type = 'prerelease';

  if (undefined !== util.env.release_type) {
    release_type = util.env.release_type;
  }

  var stream = gulp.src('./package.json')
    .pipe(bump({
      type: release_type
    }))
    .pipe(gulp.dest('./')).on('end', function () {
      //  Get package again because the one in memory now has an old version number
      pkg = reload('./package.json');
    });

  return stream;
});

gulp.task('release_cc_fonts', ['bump_version_number'], function () {
  return process_fonts(cc_assets_config.fonts);
});

gulp.task('release_cc_images', ['release_cc_fonts'], function () {
  return process_images(cc_assets_config.images);
});

gulp.task('release_cc_javascripts', ['release_cc_images'], function () {
  return process_javascripts(cc_assets_config.javascripts);
});

gulp.task('release_cc_stylesheets', ['release_cc_javascripts'], function () {
  return process_stylesheets(cc_assets_config.stylesheets);
});

gulp.task('release_assets_compile', ['release_cc_stylesheets'], function (callback) {
  return callback();
});

gulp.task('copy_to_dist', ['release_assets_compile'], function () {
  return gulp.src(dist_dirs.source).pipe(gulp.dest(dist_dirs.dest));
});

gulp.task('git_actions', ['copy_to_dist'], function (callback) {
  var tag_version = 'v' + pkg.version;
  var commit_msg  = 'Committing changes for ' + tag_version;

  var git_commands = [
    'git add .',
    'git commit -m "' + commit_msg + '"',
    'git tag -a ' + tag_version + ' -m "Tagging as ' + tag_version + '"',
    'git push origin master --tags'
  ].join(' && ');

  return exec(git_commands, function(err, stdout, stderr) {
    util.log(stdout);
    util.log(stderr);
    callback(err);
  });
});

gulp.task('release', ['git_actions'], function () {
  // bower publish
});



//  Generic tasks
gulp.task('watch', function () {
  //  Application assets
  gulp.watch(app_assets_config.fonts.source       + '/**',     ['app_fonts']);
  gulp.watch(app_assets_config.images.source      + '/**',     ['app_images']);
  gulp.watch(app_assets_config.javascripts.source + '/*.js',   ['app_javascripts']);
  gulp.watch(app_assets_config.stylesheets.source + '/*.scss', ['app_stylesheets']);

  //  Style guide assets
  gulp.watch(cc_assets_config.fonts.source       + '/**',        ['cc_fonts']);
  gulp.watch(cc_assets_config.images.source      + '/**',        ['cc_images']);
  gulp.watch(cc_assets_config.javascripts.source + '/**/*.js',   ['cc_javascripts']);
  gulp.watch(cc_assets_config.stylesheets.source + '/**/*.scss', ['cc_stylesheets']);
});

gulp.task('default', [
  'all_assets'
]);
