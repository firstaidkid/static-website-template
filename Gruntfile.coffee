module.exports = (grunt) ->
  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-contrib-cssmin'
  grunt.loadNpmTasks 'grunt-contrib-concat'
  grunt.loadNpmTasks 'grunt-contrib-compress'
  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-contrib-imagemin'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-sass'
  grunt.loadNpmTasks 'grunt-targethtml'
  grunt.loadNpmTasks 'grunt-typescript'
  grunt.loadNpmTasks 'grunt-ftp-deploy'

  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'

    clean: ['dest']

    sass:
      dist:
        options:
          style: 'compressed'
        files:
            'src/css/screen.css': 'src/scss/screen.scss'

    typescript: 
      base: 
        src: ['src/ts/**/*.ts']
        dest: 'src/js/'
        options:
          module: 'amd'
          target: 'es5'
          rootDir: 'src/ts'
          sourceMap: true
          declaration: true

    watch:
      css:
        files: ['src/scss/*.scss','src/ts/**/*.ts']
        tasks: ['sass','typescript']
        options:
          spawn: false
          

    concat:
      dist:
        files: [
          src: [
            'src/js/vendor/modernizr.js'
            'src/js/app.js'
          ]
          dest: 'dest/js/script.js'
        ]

    uglify:
      options:
        report: 'min'
        banner: '/*! <%= pkg.name %> <%= grunt.template.today("yyyy-mm-dd") %> */\n'
      dist:
        files: [
          src: 'dest/js/script.js', dest: 'dest/js/script.min.js'
        ]

    cssmin:
      options:
        report: 'min'
        banner: '/*! <%= pkg.name %> <%= grunt.template.today("yyyy-mm-dd") %> */'
      dist:
        files:
          'dest/css/style.min.css': ['src/css/screen.css']

    targethtml:
      dist:
        files:
          'dest/index.html': 'src/index.html'

    imagemin:
      dist:
        options:
          optimizationLevel: 2
        files: [
          expand: true
          cwd: 'images'
          src: ['src/images/**/*.png', 'src/images/**/*.jpg']
          dest: 'dest/images/'
        ]

    'ftp-deploy':
      build:
        auth:
          host: 'steffenkolb.de'
          port: 21
        src: 'dest'
        dest: 'projects/<%= pkg.name %>'
        exclusions: ['dest/**/.DS_Store', 'dest/**/Thumbs.db']

    compress:
      dist:
        options:
          mode: 'zip'
          archive: 'build/<%= pkg.name %>_<%= grunt.template.today("yyyymmdd_HHMMSS") %>.zip'
        files: [
          src: [
            'dest'
          ]
        ]

  grunt.registerTask 'default', ['clean', 'concat', 'uglify', 'cssmin', 'targethtml', 'imagemin']
  grunt.registerTask 'zip', ['default', 'compress']
  grunt.registerTask 'deploy', ['default', 'ftp-deploy']
