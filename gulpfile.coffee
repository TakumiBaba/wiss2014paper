gulp = require 'gulp'
pandoc = require 'gulp-pandoc'
exec = require 'gulp-exec'

gulp.task 'md2latex', ->
  gulp.src 'sections/*.md'
  .pipe pandoc
    from: 'markdown'
    to: 'latex'
    ext: '.tex'
  .pipe gulp.dest '.tmp/'

gulp.task 'latex2pdf', ->
  gulp.src './paper.tex'
  .pipe exec 'lualatex <%= file.path %>'
  .pipe exec.reporter()

gulp.task 'clean', ->
  target = [
    "**/*.dvi", "**/*.log",
    "**/*.aux", "**/*.blg",
    "**/*.bbl",
  ]
  gulp.src target
  .pipe exec 'rm <%= file.path %>'

gulp.task 'test', ->

gulp.task 'deploy', ->

gulp.task 'default', ->
  gulp.watch ["**/*.md", "paper.tex"], ["md2latex", "latex2pdf"]