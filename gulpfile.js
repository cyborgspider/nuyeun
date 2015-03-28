var gulp        = require('gulp'),
    $           = require('gulp-load-plugins')({lazy:true}),
    browserSync = require('browser-sync'),
    clean       = require('del');

/**
 * Plain config object to hold various settings   
 */
var config = {
	outputDir: 'build/'
}  

/**
 * Utility tasks 
 */
gulp.task('clean', function(){
	clean(config.outputDir);
});    

gulp.task('server', function(){
	browserSync({
		server:{
			baseDir: "build"
		}
	})
});

gulp.task('watch', function(){
	$.livereload.listen();
	gulp.watch('src/stylus/**/*', ['stylus']);
	gulp.watch('src/index.jade', ['html']);
	gulp.watch('src/scripts/*.js', ['js']);
});

/** 
 * FED tasks
 */
gulp.task('stylus', function(){
	var nib = require('nib');

	return gulp
		.src('src/stylus/_import.styl')
		// .pipe($.sourcemaps.init())
		.pipe($.stylus({
			use:      nib(),
			compress: true
		}))
		// .pipe($.sourcemaps.write('.'))
		.pipe($.rename('suyeun.css'))
		.pipe(gulp.dest(config.outputDir + 'css'))
		.pipe($.livereload())
});

gulp.task('html', function(){
	return gulp
		.src('src/index.jade')
		.pipe($.jade({pretty: true}))
		.pipe(gulp.dest(config.outputDir))
		.pipe($.livereload())
});

gulp.task('js', function(){
	return gulp
		.src('src/scripts/*.js')
		.pipe(gulp.dest(config.outputDir + 'js'))
		.pipe($.livereload())
});

gulp.task('json', function(){
	return gulp
		.src('src/json/*')
		.pipe(gulp.dest(config.outputDir + 'json'))
		.pipe($.livereload())
});

gulp.task('img', function(){
	return gulp
		.src('src/images/*')
		.pipe(gulp.dest(config.outputDir + 'img'))
		.pipe($.livereload())
});

/**
 * Build/watch/deploy tasks
 */
gulp.task('default', ['clean', 'html',  'js', 'json', 'img', 'server', 'watch'], function(){
	console.log('Building, serving, watching...');
});