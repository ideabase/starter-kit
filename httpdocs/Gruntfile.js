module.exports = grunt => {
  grunt.initConfig({
    pkg: grunt.file.readJSON('package.json'),
    sass: {
      dist: {
        options: {
          style: 'compressed'
        },
        files: {
          'assets/css/_global-intermediate.css': 'assets/_sass/global.scss'
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
    purgecss: {
      my_target: {
        options: {
          content: [
            '../templates/**/*.twig',
            '../templates/**/*.html'
          ]
        },
        files: {
          'assets/css/global.css': ['assets/css/_global-intermediate.css']
        }
      }
    },
    criticalcss: {
      custom: {
        options: {
          url: "LOCAL URL",
          width: 1200,
          height: 900,
          outputfile: "assets/css/critical.css",
          filename: "assets/css/global.css",
          buffer: 800 * 1024,
          ignoreConsole: false
        }
      }
    },
    uglify: {
      my_target: {
        files: {
          'assets/js/min/global.min.js': ['assets/js/*.js'],
        }
      }
    },
    watch: {
      css: {
        files: '**/*.scss',
        tasks: ['sass', 'postcss', 'purgecss'],
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
  })

  // Plugins
  grunt.loadNpmTasks('grunt-contrib-sass')
  grunt.loadNpmTasks('grunt-contrib-uglify')
  grunt.loadNpmTasks('grunt-contrib-watch')
  grunt.loadNpmTasks('grunt-criticalcss')
  grunt.loadNpmTasks('grunt-postcss')
  grunt.loadNpmTasks('grunt-purgecss')

  // Tasks
  grunt.registerTask('default', ['watch'])
  grunt.registerTask('critical', ['criticalcss', 'postcss'])
}
