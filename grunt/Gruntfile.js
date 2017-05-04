module.exports = function (grunt) {
var config = {
    path: __dirname,
    src: __dirname + '/src',
    dest: __dirname + '/dist'
    };
	grunt.loadNpmTasks('grunt-contrib-clean');
	grunt.loadNpmTasks('grunt-contrib-concat');
	grunt.loadNpmTasks('grunt-contrib-copy');
	grunt.loadNpmTasks('grunt-contrib-connect');
	grunt.loadNpmTasks('grunt-contrib-htmlmin');
	grunt.loadNpmTasks('grunt-contrib-cssmin');
	grunt.loadNpmTasks('grunt-contrib-imagemin');
	grunt.loadNpmTasks('grunt-contrib-watch');
	grunt.loadNpmTasks('grunt-filerev');
	grunt.loadNpmTasks('grunt-filerev-replace');
	grunt.loadNpmTasks('grunt-contrib-uglify');
	grunt.loadNpmTasks('grunt-usemin');

	grunt.initConfig({
	  config:config
	  uglify:{
	  	start:{
	  		src:'src/*.js',
	  		dest:'src/test.min.js'
	  	}
	  	
	  },
	  clean:{
	  	start:{
	  		src:'src/*.css'
	  	}
	  },
	  cssmin:{
	  	  start: {
		    files: [{
		      expand: true,
		      cwd: 'src/',
		      src: ['*.css', '!*.min.css'],
		      dest: 'src/',
		      ext: '.min.css'
		    }]
        }
	  },
	  // Filerev all js
	    watch:{
            start:{
                files: ['src/*.html']
            }
        },
		filerev: {
		    options: {
		        algorithm: 'md5',
		        length: 8
		    },
		    js: {
		        src: 'src/*.js'
		    }
		},
	
	  // Replace references to the images in the compiled js and css files, and the html views
	  filerev_replace: {
	    options: {
	      assets_root: 'src/',
	      views_root:  'src/'
	      
	    },
	    js: {
	        src: 'src/index.html'
	    }
	  }
	});
	grunt.event.on('watch', function(action, filepath, target) {
       grunt.log.writeln(target + ': ' + filepath + ' has ' + action);
    });
	grunt.registerTask("default", ['filerev:js', 'filerev_replace:js','uglify','cssmin','clean']);
	                               //js加时间戳                         html中js引用改变                    js压缩            css压缩          多余css删除 

}