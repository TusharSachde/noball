var jsArray = [
  './bower_components/jquery/dist/jquery.min.js',
  './js/threejs/three.min.js',
  './js/threejs/OrbitControls.js',
  './js/threejs/OBJLoader.js',
  './js/jquery.arctext.js',
  './bower_components/flexslider/jquery.flexslider-min.js',
  './bower_components/bootstrap-sass/assets/javascripts/bootstrap.min.js',

  './bower_components/angular/angular.js',
  // './bower_components/elevatezoom/jquery.elevatezoom.js',
  './bower_components/angular-animate/angular-animate.min.js',
  './bower_components/angular-flexslider/angular-flexslider.js',
  './bower_components/angular-sanitize/angular-sanitize.min.js',
  './bower_components/angular-rangeslider/angular.rangeSlider.js',
  './bower_components/angular-loading-bar/src/loading-bar.js',
  './bower_components/ui-router/release/angular-ui-router.min.js',
  './lib/js/ngDialog.js',
  './lib/js/angular-route.min.js',
  './lib/js/angular-animate.min.js',
  './lib/js/angular-file-upload.js',
  './lib/js/FileAPI.min.js',
  './lib/js/upload.js',
  './lib/js/lodash.min.js',
  './bower_components/angular-bootstrap/ui-bootstrap.min.js',
  './bower_components/angular-bootstrap/ui-bootstrap-tpls.min.js',
  './bower_components/fancyBox/source/jquery.fancybox.pack.js',
  './bower_components/jStorage/jstorage.min.js',
  './bower_components/lodash/lodash.min.js',
  './bower_components/ngDialog/js/ngDialog.min.js',
  './bower_components/angular-scroll/angular-scroll.min.js',
  './bower_components/angulartics/dist/angulartics.min.js',
  './bower_components/angular-google-analytics/dist/angular-google-analytics.js',
  './bower_components/angulartics-google-analytics/dist/angulartics-ga.min.js',

  './js/app.js',
  './js/controllers.js',
  './js/customui.js',
  './js/navigation.js',
  './js/templateservice.js',

  //please do not change it
  './w/js/templates.js',
];
var replacehostFrom = "http://localhost/demo/";
var replacehostTo = "http://wohlig.co.in/demo2/";


var ftpString = "U2FsdGVkX18aCMwda1/CcmWUElO9RhbZYtjQPfvu7tCSdlZet2/X0eTzycdDr5BoKPPYwwiMoNDzCVAlvk80wjO1V4u8TBEsRf956gWkESug7IjdJMinftn2JTchSpqV";

var uploadingFolder = "ccctest";
var password = "";



//Do not change anything below
//Do not change anything below
//Do not change anything below
//Do not change anything below
//Do not change anything below
//Do not change anything below
var CryptoJS = require("crypto-js");
var gulp = require('gulp');
var sass = require('gulp-sass');
var sourcemaps = require('gulp-sourcemaps');
var watch = require('gulp-watch');
var connect = require("gulp-connect");
var minifyHTML = require('gulp-minify-html');
var gulpCopy = require('gulp-copy');
var templateCache = require('gulp-angular-templatecache');
var concat = require('gulp-concat');
var minifyCss = require('gulp-minify-css');
var rename = require('gulp-rename');
var uglify = require('gulp-uglify');
var inline = require('gulp-inline');
var gzip = require('gulp-gzip');
var tar = require('gulp-tar');
var gulpSequence = require('gulp-sequence');
var clean = require('gulp-clean');
var open = require('gulp-open');
var wait = require('gulp-wait');
var zip = require('gulp-zip');
var gutil = require('gulp-util');
var replace = require('gulp-replace');
var imagemin = require('gulp-imagemin');
var prompt = require("gulp-prompt");
var ftp = require('vinyl-ftp');
var shell = require('gulp-shell');

var templateCacheBootstrap = "firstapp.run(['$templateCache', function($templateCache) {";

gulp.task('imagemin', function () {
  return gulp.src('./img/**')
    .pipe(imagemin({
      progressive: true,
      svgoPlugins: [{
        removeViewBox: false
      }]
    }))
    .pipe(gulp.dest('./img2/'));
});

gulp.task('deploy', function () {
  return gulp.src('./index.html')
    .pipe(prompt.prompt([{
      type: 'password',
      name: 'password',
      message: 'Enter Encryption Password:'
    }], function (res) {
      password = res.password;
      gulp.start('ftp');
    }));
});



gulp.task('ftp', function () {
  var decrypted = CryptoJS.AES.decrypt(ftpString, password);
  var decryptedJSON = JSON.parse(decrypted.toString(CryptoJS.enc.Utf8));

  decryptedJSON.log = gutil.log;
  var conn = ftp.create(decryptedJSON);


  var globs = [
    './production/**',
  ];

  return gulp.src(globs, {
      base: './production',
      buffer: false
    })
    .pipe(conn.newer('/public_html/' + uploadingFolder)) // only upload newer files
    .pipe(conn.dest('/public_html/' + uploadingFolder));

});

gulp.task('clean:production', function () {
  return gulp.src('./production', {
      read: false
    })
    .pipe(wait(200))
    .pipe(clean({
      force: true
    }));
});

gulp.task('clean:tmp', function () {
  return gulp.src('./tmp', {
      read: false
    })
    .pipe(wait(200))
    .pipe(clean({
      force: true
    }));
});


gulp.task('clean:w', function () {
  return gulp.src('./w', {
      read: false
    })
    .pipe(wait(200))
    .pipe(clean());
});

gulp.task('minify:css', function () {
  return gulp.src('./w/main.css')
    .pipe(minifyCss({
      keepSpecialComments: 0,
      rebase: false
    }))
    .pipe(rename('w.css'))
    .pipe(replace('url(../', 'url('))
    .pipe(replace("url('../", "url('"))
    .pipe(replace('url("../', 'url("'))
    .pipe(gulp.dest('./w/'));
});

gulp.task('copy:indexhtml', function () {
  return gulp.src("./w/index.html")
    .pipe(gulpCopy("./production/", {
      prefix: 1
    }));
});

gulp.task('gzipfile', function () {
  gulp.src('./w/index.html')
    .pipe(gzip({
      preExtension: 'gz'
    }))
    .pipe(gulp.dest('./production/'));
});

gulp.task('tarball', function () {
  gulp.src('./production/**')
    .pipe(tar('production.tar'), {
      "mode": 0755,
      "type": 'directory'
    })
    .pipe(gulp.dest('./'));
});

gulp.task('inlinesource', function () {
  return gulp.src('./w/index.html')
    .pipe(inline({
      base: './w',
      disabledTypes: ['svg', 'img'] // Only inline css files
    }))
    .pipe(gulp.dest('./w/'));
});



gulp.task('uglify:js', function () {
  return gulp.src('./w/w.js')
    .pipe(uglify({
      mangle: false
    }))
    .pipe(gulp.dest('./w'));
});

gulp.task('concat:js', function () {
  return gulp.src(jsArray)
    .pipe(concat('w.js'))
    .pipe(replace(replacehostFrom, replacehostTo))
    .pipe(gulp.dest('./w'));
});

gulp.task('templatecache', function () {
  return gulp.src('./w/views/**/*.html')

    .pipe(templateCache({
      root: "views/",
      templateHeader: templateCacheBootstrap
    }))
    .pipe(gulp.dest('./w/js/'));
});


gulp.task('copy:img', function () {
  return gulp.src("./img/**")
    .pipe(gulpCopy("./production/"));
});

gulp.task('copy:fonts', function () {
  return gulp.src("./fonts/**")
    .pipe(gulpCopy("./production/"));
});


gulp.task('sass:production', function () {
  gulp.src('./sass/*.scss')
    .pipe(sass({
      outputStyle: 'compressed'
    }).on('error', sass.logError))
    .pipe(gulp.dest('./w'));
});

gulp.task('sass:development', function () {
  gulp.src('./sass/*.scss')
    .pipe(sourcemaps.init())
    .pipe(sass().on('error', sass.logError))
    .pipe(sourcemaps.write())
    .pipe(gulp.dest('./css'))
    .pipe(connect.reload());
});
gulp.task('minify:indexproduction', function () {
  var opts = {
    conditionals: true,
    spare: true
  };
  return gulp.src('./indexproduction.html')
    .pipe(minifyHTML(opts))
    .pipe(rename('index.html'))
    .pipe(gulp.dest('./w/'));
});
gulp.task('minify:views', function () {
  var opts = {
    conditionals: true,
    spare: true
  };

  return gulp.src('./views/**/*.html')
    .pipe(minifyHTML(opts))
    .pipe(gulp.dest('./w/views/'));
});
gulp.task('connect:html', function () {
  gulp.src('./**/*.html')
    .pipe(connect.reload());
});
gulp.task('connect:js', function () {
  gulp.src('./js/*.js')
    .pipe(connect.reload());
});
gulp.task('watch:all', function () {
  connect.server({
    root: './',
    livereload: true
  });
  gulp.src(__filename)
    .pipe(open({
      uri: 'http://localhost:8080'
    }));
  gulp.watch(['./**/*.html', './sass/*.scss', './js/*.js'], ['sass:development', 'connect:html', 'connect:js']);
});

gulp.task('zip', function () {
  return gulp.src('./production/**/*')
    .pipe(zip('production.zip'))
    .pipe(gulp.dest('./'));
});


gulp.task('watch', ["sass:development", "watch:all"]);
gulp.task('default', ["sass:development", "watch:all"]);
gulp.task('development', ["sass:development", "watch:all"]);
gulp.task('minifyhtml', ["minify:indexHTML", "minify:views", "templatecache"]);
gulp.task('copy', ["copy:img", "copy:fonts"]);


gulp.task('production', gulpSequence(["copy:img", "copy:fonts", "sass:production", "minify:indexproduction", "minify:views"], 'clean:tmp', ["minify:css", "templatecache"], "concat:js", 'clean:tmp', "uglify:js", 'clean:tmp', "inlinesource", 'clean:tmp', "gzipfile", 'clean:tmp', 'clean:tmp', "zip"));
gulp.task('production2', gulpSequence(["copy:img", "copy:fonts", "sass:production", "minify:indexproduction", "minify:views"], 'clean:tmp', ["minify:css", "templatecache"], "concat:js", 'clean:tmp', "uglify:js", 'clean:tmp', "inlinesource", 'clean:tmp', "copy:indexhtml", 'clean:tmp', 'clean:tmp', "zip"));

gulp.task('cloudTest', shell.task([
  "rm -rf /var/www/html/test",
  "mv production test",
  "mv test /var/www/html",
  "mv /var/www/html/test/index.html /var/www/html/",
  "rm -rf /var/www/html/img",
  "mv /var/www/html/test/img /var/www/html/"
]));

gulp.task('productioncloud', gulpSequence("production2", "cloudTest"));
gulp.task('productionc', gulpSequence(["copy:img", "copy:fonts", "sass:production", "minify:indexproduction", "minify:views"], 'clean:tmp', "concat:js", 'clean:tmp', "templatecache", "uglify:js", "minify:css", 'clean:tmp', "inlinesource", 'clean:tmp', 'clean:production', "gzipfile", 'clean:tmp', 'clean:tmp', "zip", 'deploy'));