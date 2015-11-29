/*
  Specifying the production environment:

    gulp --rails_env=production
*/

'use strict';

//  Load package.json as JSON object
var pkg = require('./package.json');

//  Load Gulp Dependencies
var gulp        = require('gulp');
var header      = require('gulp-header');
var notify      = require('gulp-notify');
var plumber     = require('gulp-plumber');
var require_dir = require('require-dir');
var rev_all     = require('gulp-rev-all');
var sourcemaps  = require('gulp-sourcemaps');
var util        = require('gulp-util');



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
var app_assets = {
  images: {
    source:    'app/assets/images',
    dest_dir:  'public/assets/images'
  },
  javascripts: {
    source:    'app/assets/javascripts',
    main:      'application.js',
    dest_dir:  'public/assets/javascripts',
    dest_file: 'application.js'
  },
  stylesheets: {
    source:    'app/assets/stylesheets',
    main:      'application.scss',
    dest_dir:  'public/assets/stylesheets',
    dest_file: 'application.css'
  }
};

//  Set style guide assets configuration
var cc_assets = {
  images: {
    source:    'app/assets/code_club/images',
    dest_dir:  'public/assets/code_club/images'
  },
  javascripts: {
    source:    'app/assets/code_club/javascripts',
    main:      'code_club.js',
    dest_dir:  'public/assets/code_club/javascripts',
    dest_file: 'code_club.js'
  },
  stylesheets: {
    source:    'app/assets/code_club/stylesheets',
    main:      'code_club.scss',
    dest_dir:  'public/assets/code_club/stylesheets',
    dest_file: 'code_club.css'
  }
};



//  Utility functions
function handleError(error) {
  util.log(error.toString());

  notify({
    message: error
  });

  return this.emit('end');
}

function env_is(env) {
  return undefined !== util.env.rails_env && (util.env.rails_env === env);
}

function env_is_production() {
  return env_is('production');
}

function progress(main, message) {
  var output = '';

  if (undefined !== message) {
    output = util.log('- ' + message);
  }
  else {
    output = util.log('- ' + main + ' - ' + message);
  }

  return output;
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
      progress('Begin Compilation');
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
    progress('Images Compressed');
  });

  stream = stream.pipe(gulp.dest(dest_dir)).on('end', function () {
    progress('Writing files to ' + dest_dir);
  }).on('error', handleError);

  return stream;
};



//  Master JavaScript processing function
function process_javascripts(config) {
  var babel  = require('gulp-babel');
  var uglify = require('gulp-uglify');

  var main      = config.main;
  var dest_dir  = config.dest_dir;
  var dest_file = config.dest_file;

  var stream = gulp.src(config.source + '/' + main)
    .pipe(plumber({
      errorHandler: handleError
    })).on('end', function () {
      progress(main, 'Begin Compilation');
    });

  stream = stream.pipe(sourcemaps.init()).on('end', function () {
    progress(main, 'Init Sourcemap');
  });

  stream = stream.pipe(babel({
    presets: ['es2015']
  })).on('end', function () {
    progress(main, 'Transpiling ES6');
  });

  if (env_is_production()) {
    stream = stream.pipe(uglify()).on('end', function () {
      progress(main, 'Uglifying');
    });
  }

  stream = stream.pipe(header(banner, { dest_file: dest_file, pkg: pkg } )).on('end', function () {
    progress(main, 'Creating banner');
  });

  stream = stream.pipe(sourcemaps.write('.')).on('end', function () {
    progress(main, 'Generating Sourcemap');
  });

  stream = stream.pipe(gulp.dest(dest_dir)).on('end', function () {
    progress(main, 'Writing file to ' + dest_dir);
  }).on('error', handleError);

  return stream;
}



//  Master Stylesheet processing function
function process_stylesheets(config) {
  var autoprefixer = require('gulp-autoprefixer');
  var minify_css   = require('gulp-minify-css');
  var sass         = require('gulp-sass');

  var main      = config.main;
  var dest_dir  = config.dest_dir;
  var dest_file = config.dest_file;

  var stream = gulp.src(config.source + '/' + main)
    .pipe(plumber({
      errorHandler: handleError
    })).on('end', function () {
      progress(main, 'Begin Compilation');
    });

  stream = stream.pipe(sourcemaps.init()).on('end', function () {
    progress(main, 'Init Sourcemap');
  });

  stream = stream.pipe(sass()).on('end', function () {
    progress(main, 'Compile Sass');
  });

  stream = stream.pipe(autoprefixer()).on('end', function () {
    progress(main, 'Autoprefixing');
  });

  if (env_is_production()) {
    stream = stream.pipe(minify_css()).on('end', function () {
      progress(main, 'Minifying Compiled Styles');
    });
  }

  stream = stream.pipe(header(banner, { dest_file: dest_file, pkg: pkg } )).on('end', function () {
    progress(main, 'Creating banner');
  });

  stream = stream.pipe(sourcemaps.write('.')).on('end', function () {
    progress(main, 'Generating Sourcemap');
  });

  stream = stream.pipe(gulp.dest(dest_dir)).on('end', function () {
    progress(main, 'Writing file to ' + dest_dir);
  }).on('error', handleError);

  return stream;
}



//  Application assets tasks
gulp.task('app_images', function () {
  return process_images(app_assets.images);
});

gulp.task('app_javascripts', function () {
  return process_javascripts(app_assets.javascripts);
});

gulp.task('app_stylesheets', function () {
  return process_stylesheets(app_assets.stylesheets);
});

//  Style guide assets tasks
gulp.task('cc_images', function () {
  return process_images(cc_assets.images);
});

gulp.task('cc_javascripts', function () {
  return process_javascripts(cc_assets.javascripts);
});

gulp.task('cc_stylesheets', function () {
  return process_stylesheets(cc_assets.stylesheets);
});



//  Release tasks

gulp.task('bump_version_number', function () {
  var bump = require('gulp-bump');

  var release_type = 'patch';

  if (undefined !== util.env.release_type) {
    release_type = util.env.release_type;
  }

  gulp.src('./package.json')
    .pipe(bump({
      type: release_type
    }))
    .pipe(gulp.dest('./'));
});


gulp.task('set_release_vars', function () {
  util.env.rails_env = 'production';
});

gulp.task('release', [
  'set_release_vars',
  'bump_version_number',
  'app_javascripts',
  'app_stylesheets',
  'cc_javascripts',
  'cc_stylesheets'
], function () {
  util.log('all done!');
});



//  Generic tasks
gulp.task('watch', function () {
  //  Application assets
  gulp.watch(app_assets.images.source      + '/*',      ['app_images']);
  gulp.watch(app_assets.javascripts.source + '/*.js',   ['app_javascripts']);
  gulp.watch(app_assets.stylesheets.source + '/*.scss', ['app_stylesheets']);

  //  Style guide assets
  gulp.watch(cc_assets.images.source      + '/*',         ['cc_images']);
  gulp.watch(cc_assets.javascripts.source + '/**/*.js',   ['cc_javascripts']);
  gulp.watch(cc_assets.stylesheets.source + '/**/*.scss', ['cc_stylesheets']);
});

gulp.task('default', [
  'app_javascripts',
  'app_stylesheets',
  'cc_javascripts',
  'cc_stylesheets'
]);
