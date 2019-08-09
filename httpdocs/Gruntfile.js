module.exports = function (grunt) {
  grunt.initConfig({
    pkg: grunt.file.readJSON('package.json'),
    sass: {
      dist: {
        options: {
          style: 'compressed'
        },
        files: {
          'assets/css/style.css': 'assets/_sass/style.scss'
        }
      }
    },
    postcss: {
      options: {
        map: false,
        processors: [
          require('pixrem')(),
          require('autoprefixer')(),
          require('cssnano')()
        ]
      },
      dist: {
        src: 'assets/css/*.css'
      }
    },
    criticalcss: {
      custom: {
        options: {
          url: "LOCAL URL",
          width: 1200,
          height: 900,
          outputfile: "assets/css/critical.css",
          filename: "assets/css/style.css",
          buffer: 800 * 1024,
          ignoreConsole: false
        }
      }
    },
    uglify: {
      my_target: {
        files: {
          'assets/js/min/scripts.js': ['assets/js/*.js'],
        }
      }
    },
    watch: {
      css: {
        files: '**/*.scss',
        tasks: ['sass', 'postcss'],
        options: {
          livereload: true
        }
      },
      js: {
        files: '**/js/*.js',
        tasks: ['uglify'],
        options: {
          livereload: true
        }
      }
    }
  });

  // Plugins
  grunt.loadNpmTasks('grunt-contrib-sass');
  grunt.loadNpmTasks('grunt-contrib-uglify');
  grunt.loadNpmTasks('grunt-contrib-watch');
  grunt.loadNpmTasks('grunt-criticalcss');
  grunt.loadNpmTasks('grunt-postcss');

  // Tasks
  grunt.registerTask('default', ['watch']);
  grunt.registerTask('critical', ['criticalcss', 'postcss']);
};
