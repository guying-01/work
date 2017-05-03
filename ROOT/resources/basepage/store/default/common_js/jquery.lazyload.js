(function(b,a){var c=b(a);b.fn.lazyload=function(d){var f=this;var g;var e={threshold:0,failure_limit:0,event:"scroll",effect:"show",container:a,data_attribute:"original",skip_invisible:true,appear:null,load:null};function h(){var i=0;f.each(function(){var j=b(this);if(e.skip_invisible&&!j.is(":visible")){return}if(b.abovethetop(this,e)||b.leftofbegin(this,e)){}else{if(!b.belowthefold(this,e)&&!b.rightoffold(this,e)){j.trigger("appear")}else{if(++i>e.failure_limit){return false}}}})}if(d){if(undefined!==d.failurelimit){d.failure_limit=d.failurelimit;delete d.failurelimit}if(undefined!==d.effectspeed){d.effect_speed=d.effectspeed;delete d.effectspeed}b.extend(e,d)}g=(e.container===undefined||e.container===a)?c:b(e.container);if(0===e.event.indexOf("scroll")){g.bind(e.event,function(i){return h()})}this.each(function(){var i=this;var j=b(i);i.loaded=false;j.one("appear",function(){if(!this.loaded){if(e.appear){var k=f.length;e.appear.call(i,k,e)}b("<img />").bind("load",function(){j.hide().attr("src",j.data(e.data_attribute))[e.effect](e.effect_speed);i.loaded=true;var l=b.grep(f,function(n){return !n.loaded});f=b(l);if(e.load){var m=f.length;e.load.call(i,m,e)}}).attr("src",j.data(e.data_attribute))}});if(0!==e.event.indexOf("scroll")){j.bind(e.event,function(k){if(!i.loaded){j.trigger("appear")}})}});c.bind("resize",function(i){h()});h();return this};b.belowthefold=function(e,f){var d;if(f.container===undefined||f.container===a){d=c.height()+c.scrollTop()}else{d=b(f.container).offset().top+b(f.container).height()}return d<=b(e).offset().top-f.threshold};b.rightoffold=function(e,f){var d;if(f.container===undefined||f.container===a){d=c.width()+c.scrollLeft()}else{d=b(f.container).offset().left+b(f.container).width()}return d<=b(e).offset().left-f.threshold};b.abovethetop=function(e,f){var d;if(f.container===undefined||f.container===a){d=c.scrollTop()}else{d=b(f.container).offset().top}return d>=b(e).offset().top+f.threshold+b(e).height()};b.leftofbegin=function(e,f){var d;if(f.container===undefined||f.container===a){d=c.scrollLeft()}else{d=b(f.container).offset().left}return d>=b(e).offset().left+f.threshold+b(e).width()};b.inviewport=function(d,e){return !b.rightofscreen(d,e)&&!b.leftofscreen(d,e)&&!b.belowthefold(d,e)&&!b.abovethetop(d,e)};b.extend(b.expr[":"],{"below-the-fold":function(d){return b.belowthefold(d,{threshold:0})},"above-the-top":function(d){return !b.belowthefold(d,{threshold:0})},"right-of-screen":function(d){return b.rightoffold(d,{threshold:0})},"left-of-screen":function(d){return !b.rightoffold(d,{threshold:0})},"in-viewport":function(d){return !b.inviewport(d,{threshold:0})},"above-the-fold":function(d){return !b.belowthefold(d,{threshold:0})},"right-of-fold":function(d){return b.rightoffold(d,{threshold:0})},"left-of-fold":function(d){return !b.rightoffold(d,{threshold:0})}})})(jQuery,window);