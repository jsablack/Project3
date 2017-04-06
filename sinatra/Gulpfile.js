var gulp = require('gulp'),
	less = require('gulp-less'),
	watch = require('gulp-watch');

	gulp.task('watch', function(){
		gulp.watch(['./public/css/*.less'], ['compile-less'])
	});

	gulp.task('compile-less', function(){
		gulp.src('./public/css/*.less')
		.pipe(less())
		.pipe(gulp.dest('./public/css/'));
	})

	gulp.task('default', ['compile-less', 'watch']);