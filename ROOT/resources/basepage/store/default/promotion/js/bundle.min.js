/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};

/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {

/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId])
/******/ 			return installedModules[moduleId].exports;

/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			exports: {},
/******/ 			id: moduleId,
/******/ 			loaded: false
/******/ 		};

/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);

/******/ 		// Flag the module as loaded
/******/ 		module.loaded = true;

/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}


/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;

/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;

/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";

/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(0);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ function(module, exports, __webpack_require__) {

	window.onload = function () {
	    __webpack_require__(1);
	}


/***/ },
/* 1 */
/***/ function(module, exports, __webpack_require__) {
	var changeScence = __webpack_require__(2);
	var mySwiper = new Swiper('.swiper-container', {
	    direction: 'vertical',
	    onInit: function (evt) {
	      //一加载的时候的动画
	      // console.log(evt.activeIndex);
	      // changeScence(evt.previousIndex, evt.activeIndex);

	    },
	    onTouchStart: function (evt) {
	    	console.log(2)
	        evt.slides[evt.activeIndex].style.transition = 'none';

	    },
	    onTouchMove: function (evt) {
	        var offset = Math.abs(evt.touches.currentY - evt.touches.startY);
	        var scale = 1 - (offset / window.innerHeight) * 0.2;
	        evt.slides[evt.activeIndex].style.transform = 'scale(0.97)';
	        evt.slides[evt.activeIndex].style.transition = 'all 0.3s linear';


	    },
	    onTouchEnd: function (evt) {
	        //回到一开始的样子
	        evt.slides[evt.activeIndex].style.transform = 'scale(1)';
	        evt.slides[evt.activeIndex].style.transition = 'all 0.3s linear';

	    },
	    onSlideChangeStart: function (evt) {

	    },
	    onSlideChangeEnd: function (evt) {
	        changeScence(evt.previousIndex, evt.activeIndex);
	    }
	});


/***/ },
/* 2 */
/***/ function(module, exports) {

	var animations = [
	    {
	        entry: function () {

	        },
	        exit: function () {
	        }
	    },
	    {
	        entry: function () {

	        },
	        exit: function () {

	        }
	    },
	    {
	        entry: function () {

	        },
	        exit: function () {

	        }
	    },
	    {
	        entry: function () {
	            var pic = document.querySelector('.swiper-slide-fourth div');
	            pic.style.transform = 'translateX(310px)';
	            pic.style.transition = 'all 1s';

	            var list = document.querySelector('.swiper-slide-fourth .salary-list');
	            var tipOne = document.querySelector('.salary-list .sly1');
	            var tipTwo = document.querySelector('.salary-list .sly2');
	            var tipThree = document.querySelector('.salary-list .sly3');


	            tipOne.style.transform = 'translateX(-300px)';
	            tipTwo.style.transform = 'translateX(616px)';
	            tipThree.style.transform = 'translateX(-322px)';
	            list.style.transform = 'translateX(-338px) scale(1.2)';
	            list.style.transition = 'all 1s';
	            tipOne.style.transition = 'all 1s';
	            tipTwo.style.transition = 'all 1s';
	            tipThree.style.transition = 'all 1s';



	        },
	        exit: function () {
	            var pic = document.querySelector('.swiper-slide-fourth div');
	            pic.style.transform = 'translateX(0)';
	            pic.style.transition = 'none';
	            var list = document.querySelector('.swiper-slide-fourth .salary-list');
	            list.style.transform = 'translateX(0)';
	            list.style.transition = 'none';

	            var tipOne = document.querySelector('.salary-list .sly1');
	            var tipTwo = document.querySelector('.salary-list .sly2');
	            var tipThree = document.querySelector('.salary-list .sly3');


	            tipOne.style.transform = 'translateX(0)';
	            tipTwo.style.transform = 'translateX(0)';
	            tipThree.style.transform = 'translateX(0)';
	            tipOne.style.transition = 'none';
	            tipTwo.style.transition = 'none';
	            tipThree.style.transition = 'none';
	        }
	    }
	];

	var changeScence = function (ago, now) {
	    animations[ago].exit();
	    
	    animations[now].entry();


	};

	module.exports = changeScence;


/***/ }
/******/ ]);