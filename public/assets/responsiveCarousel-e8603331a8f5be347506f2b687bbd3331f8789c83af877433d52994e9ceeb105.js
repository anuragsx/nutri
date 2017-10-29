;(function($){"use strict";$.fn.carousel=function(args){var defaults,obj;defaults={infinite:true,visible:1,speed:'slow',overflow:false,autoRotate:false,navigation:$(this).data('navigation'),itemMinWidth:0,itemEqualHeight:false,itemMargin:0,itemClassActive:'crsl-active',imageWideClass:'wide-image',carousel:true};return $(this).each(function(){obj=$(this);if($.isEmptyObject(args)===false)$.extend(defaults,args);if($.isEmptyObject($(obj).data('crsl'))===false)$.extend(defaults,$(obj).data('crsl'));defaults.isTouch='ontouchstart'in document.documentElement||navigator.userAgent.match(/Android|BlackBerry|iPhone|iPad|iPod|Opera Mini|IEMobile/i)?true:false;obj.init=function(){defaults.total=$(obj).find('.crsl-item').length;defaults.itemWidth=$(obj).outerWidth();defaults.visibleDefault=defaults.visible;defaults.swipeDistance=null;defaults.swipeMinDistance=100;defaults.startCoords={};defaults.endCoords={};$(obj).css({width:'100%'});$(obj).find('.crsl-item').css({position:'relative',float:'left',overflow:'hidden',height:'auto'});$(obj).find('.'+defaults.imageWideClass).each(function(){$(this).css({display:'block',width:'100%',height:'auto'});});$(obj).find('.crsl-item iframe').attr({width:'100%'});if(defaults.carousel)$(obj).find('.crsl-item:first-child').addClass(defaults.itemClassActive);if(defaults.carousel&&defaults.infinite&&(defaults.visible<defaults.total))$(obj).find('.crsl-item:first-child').before($('.crsl-item:last-child',obj));if(defaults.overflow===false){$(obj).css({overflow:'hidden'});}else{$('html, body').css({'overflow-x':'hidden'});}$(obj).trigger('initCarousel',[defaults,obj]);obj.testPreload();obj.config();obj.initRotate();obj.triggerNavs();};obj.testPreload=function(){if($(obj).find('img').length>0){var totalImages=$(obj).find('img').length,i=1;$(obj).find('img').each(function(){obj.preloadImage(this,i,totalImages);i++;});}else{$(obj).trigger('loadedCarousel',[defaults,obj]);}};obj.preloadImage=function(image,i,totalImages){var new_image=new Image(),attributes={};attributes.src=($(image).attr('src')!==undefined?image.src:'');attributes.alt=($(image).attr('alt')!==undefined?image.alt:'');$(new_image).attr(attributes);$(new_image).on('load',function(){if(i===1)$(obj).trigger('loadingImagesCarousel',[defaults,obj]);if(i===totalImages)$(obj).trigger('loadedImagesCarousel',[defaults,obj]);});};obj.config=function(){defaults.itemWidth=Math.floor(($(obj).outerWidth()-(defaults.itemMargin*(defaults.visibleDefault-1)))/defaults.visibleDefault);if(defaults.itemWidth<=defaults.itemMinWidth){defaults.visible=Math.floor(($(obj).outerWidth()-(defaults.itemMargin*(defaults.visible-1)))/defaults.itemMinWidth)===1?Math.floor($(obj).outerWidth()/defaults.itemMinWidth):Math.floor(($(obj).outerWidth()-defaults.itemMargin)/defaults.itemMinWidth);defaults.visible=defaults.visible<1?1:defaults.visible;defaults.itemWidth=defaults.visible===1?Math.floor($(obj).outerWidth()):Math.floor(($(obj).outerWidth()-(defaults.itemMargin*(defaults.visible-1)))/defaults.visible);}else{defaults.visible=defaults.visibleDefault;}if(defaults.carousel){obj.wrapWidth=Math.floor((defaults.itemWidth+defaults.itemMargin)*defaults.total);obj.wrapMargin=obj.wrapMarginDefault=defaults.infinite&&defaults.visible<defaults.total?parseInt((defaults.itemWidth+defaults.itemMargin)*-1,10):0;if(defaults.infinite&&(defaults.visible<defaults.total)&&($(obj).find('.crsl-item.'+defaults.itemClassActive).index()===0)){$(obj).find('.crsl-item:first-child').before($('.crsl-item:last-child',obj));obj.wrapMargin=obj.wrapMarginDefault=parseInt((defaults.itemWidth+defaults.itemMargin)*-1,10);}$(obj).find('.crsl-wrap').css({width:obj.wrapWidth+'px',marginLeft:obj.wrapMargin});}else{obj.wrapWidth=$(obj).outerWidth();$(obj).find('.crsl-wrap').css({width:obj.wrapWidth+defaults.itemMargin+'px'});$('#'+defaults.navigation).hide();}$(obj).find('.crsl-item').css({width:defaults.itemWidth+'px',marginRight:defaults.itemMargin+'px'});obj.equalHeights();if(defaults.carousel){if(defaults.visible>=defaults.total){defaults.autoRotate=false;$('#'+defaults.navigation).hide();}else{$('#'+defaults.navigation).show();}}};obj.equalHeights=function(){if(defaults.itemEqualHeight!==false){var tallest=0;$(obj).find('.crsl-item').each(function(){$(this).css({'height':'auto'});if($(this).outerHeight()>tallest){tallest=$(this).outerHeight();}});$(obj).find('.crsl-item').css({height:tallest+'px'});}return true;};obj.initRotate=function(){if(defaults.autoRotate!==false){obj.rotateTime=window.setInterval(function(){obj.rotate();},defaults.autoRotate);}};obj.triggerNavs=function(){$('#'+defaults.navigation).delegate('.previous, .next','click',function(event){event.preventDefault();obj.prepareExecute();if($(this).hasClass('previous')&&obj.testPrevious(obj.itemActive)){obj.previous();}else if($(this).hasClass('next')&&obj.testNext()){obj.next();}else{return;}});};obj.prepareExecute=function(){if(defaults.autoRotate){clearInterval(obj.rotateTime);}obj.preventAnimateEvent();obj.itemActive=$(obj).find('.crsl-item.'+defaults.itemClassActive);return true;};obj.preventAnimateEvent=function(){if($(obj).find('.crsl-wrap:animated').length>0){return false;}};obj.rotate=function(){obj.preventAnimateEvent();obj.itemActive=$(obj).find('.crsl-item.'+defaults.itemClassActive);obj.next();return true;};obj.testPrevious=function(active){return $('.crsl-wrap',obj).find('.crsl-item').index(active)>0;};obj.testNext=function(){return(!defaults.infinite&&obj.wrapWidth>=(((defaults.itemWidth+defaults.itemMargin)*(defaults.visible+1))-obj.wrapMargin))||defaults.infinite;};obj.previous=function(){obj.wrapMargin=defaults.infinite?obj.wrapMarginDefault+$(obj.itemActive).outerWidth(true):obj.wrapMargin+$(obj.itemActive).outerWidth(true);var prevItemIndex=$(obj.itemActive).index();var newItemActive=$(obj.itemActive).prev('.crsl-item');var action='previous';$(obj).trigger('beginCarousel',[defaults,obj,action]);$(obj).find('.crsl-wrap').animate({marginLeft:obj.wrapMargin+'px'},defaults.speed,function(){$(obj.itemActive).removeClass(defaults.itemClassActive);$(newItemActive).addClass(defaults.itemClassActive);if(defaults.infinite){$(this).css({marginLeft:obj.wrapMarginDefault}).find('.crsl-item:first-child').before($('.crsl-item:last-child',obj));}else{if(obj.testPrevious(newItemActive)===false)$('#'+defaults.navigation).find('.previous').addClass('previous-inactive');if(obj.testNext())$('#'+defaults.navigation).find('.next').removeClass('next-inactive');}$(this).trigger('endCarousel',[defaults,obj,action]);});};obj.next=function(){obj.wrapMargin=defaults.infinite?obj.wrapMarginDefault-$(obj.itemActive).outerWidth(true):obj.wrapMargin-$(obj.itemActive).outerWidth(true);var nextItemIndex=$(obj.itemActive).index();var newItemActive=$(obj.itemActive).next('.crsl-item');var action='next';$(obj).trigger('beginCarousel',[defaults,obj,action]);$(obj).find('.crsl-wrap').animate({marginLeft:obj.wrapMargin+'px'},defaults.speed,function(){$(obj.itemActive).removeClass(defaults.itemClassActive);$(newItemActive).addClass(defaults.itemClassActive);if(defaults.infinite){$(this).css({marginLeft:obj.wrapMarginDefault}).find('.crsl-item:last-child').after($('.crsl-item:first-child',obj));}else{if(obj.testPrevious(newItemActive))$('#'+defaults.navigation).find('.previous').removeClass('previous-inactive');if(obj.testNext()===false)$('#'+defaults.navigation).find('.next').addClass('next-inactive');}$(this).trigger('endCarousel',[defaults,obj,action]);});};var mouseHover=false,current;$(window).on('mouseleave',function(event){if(event.target)current=event.target;else if(event.srcElement)current=event.srcElement;if(($(obj).attr('id')&&$(current).parents('.crsl-items').attr('id')===$(obj).attr('id'))||($(current).parents('.crsl-items').data('navigation')===$(obj).data('navigation'))){mouseHover=true;}else{mouseHover=false;}return false;});$(window).on('keydown',function(event){if(mouseHover===true){if(event.keyCode===37){obj.prepareExecute();obj.previous();}else if(event.keyCode===39){obj.prepareExecute();obj.next();}}return;});if(defaults.isTouch){$(obj).on('touchstart',function(e){$(obj).addClass('touching');defaults.startCoords.pageX=defaults.endCoords.pageX=e.originalEvent.targetTouches[0].pageX;defaults.startCoords.pageY=defaults.endCoords.pageY=e.originalEvent.targetTouches[0].pageY;$('.touching').on('touchmove',function(e){defaults.endCoords.pageX=e.originalEvent.targetTouches[0].pageX;defaults.endCoords.pageY=e.originalEvent.targetTouches[0].pageY;if(Math.abs(parseInt(defaults.endCoords.pageX-defaults.startCoords.pageX,10))>Math.abs(parseInt(defaults.endCoords.pageY-defaults.startCoords.pageY,10))){e.preventDefault();e.stopPropagation();}});}).on('touchend',function(e){e.preventDefault();e.stopPropagation();defaults.swipeDistance=defaults.endCoords.pageX-defaults.startCoords.pageX;if(defaults.swipeDistance>=defaults.swipeMinDistance){obj.prepareExecute();obj.previous();}else if(defaults.swipeDistance<=-defaults.swipeMinDistance){obj.prepareExecute();obj.next();}$('.touching').off('touchmove').removeClass('touching');});}$(obj).on('loadedCarousel loadedImagesCarousel',function(){obj.equalHeights();});$(window).on('carouselResizeEnd',function(){if(defaults.itemWidth!==$(obj).outerWidth())obj.config();});$(window).ready(function(){$(obj).trigger('prepareCarousel',[defaults,obj]);obj.init();$(window).on('resize',function(){if(this.carouselResizeTo)clearTimeout(this.carouselResizeTo);this.carouselResizeTo=setTimeout(function(){$(this).trigger('carouselResizeEnd');},10);});});$(window).load(function(){obj.testPreload();obj.config();});});};})(jQuery);