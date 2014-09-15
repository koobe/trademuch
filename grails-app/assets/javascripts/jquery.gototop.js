/**
 * @author Cloude
 * 
 * depend on:
 * jquery: http://jquery.com/
 * font awesome: http://fortawesome.github.io/Font-Awesome/
 */

(function($) {
	
	var ontopclickHandler = function(settings, scrollContainerId, alink) {
		
		var scrollContainer = $('#' + scrollContainerId);
		console.log('container scroll position: ' + scrollContainer.scrollTop());
		scrollContainer.scrollTop(0);
		
		var ua = window.navigator.userAgent;
		var msie = ua.indexOf ("MSIE ");
		var trident = ua.indexOf('Trident/');
		if ( msie > 0 ) {
			console.log('window scroll position: ' + $(window).scrollTop());
			$(window).scrollTop(0);
		}
		if ( trident > 0 ) {
			console.log('window scroll position: ' + $(window).scrollTop());
			$(window).scrollTop(0);
		}
		
		if (settings.auto_hide) {
			alink.hide();
		}
	}
	
	function GotoTop($this, alink) {
        this.$this = $this;
        this.$alink = alink;
    };
    
    GotoTop.prototype.remove = function () {
        $(this.$alink).remove();
	};
	
	$.fn.gototop = function(options) {
		
		var alink = $('<a/>').addClass('gototop-button');
		var totop = $('<i class="fa fa-caret-up"></i>');
		
		var settings = $.extend({
            auto_hide: true,
            z_index: 333
        }, options );
		
		$(this).append(alink.append(totop));
		
		var scrollContainer = $('#' + settings.containerId);
		alink.css('z-index', settings.z_index);
		
		$(alink).click(function(e) {
			ontopclickHandler(settings, settings.containerId, alink);
			e.stopPropagation();
		});
		
		if (settings.auto_hide) {
			try {
				scrollContainer.scroll(function() {
					isGotoTopDisplay(scrollContainer, alink);
				});
				scrollContainer.on({
			        'touchmove': function(e) {
			        	isGotoTopDisplay(scrollContainer, alink);
			        }
			    });
				alink.hide();
			} catch (err) {
				console.log(err);
			}
		}
		
		return new GotoTop(this, alink);
	};
	
	function isGotoTopDisplay(scrollContainer, alink) {
		if (scrollContainer.scrollTop() < 100) {
			alink.hide();
		} else {
			alink.show();
		}
	}
    
}(jQuery));