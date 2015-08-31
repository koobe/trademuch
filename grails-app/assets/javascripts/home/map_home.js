$(function() {
	
	fitContentHeight('.page-container');
	
	$(window).unbind('resize').resize(function(){
		fitContentHeight('.page-container');
	});
	
	function fitContentHeight(selector) {
		var pageContainer = $(window).height() - $('nav').height() - $('footer').height();
		$(selector).height(pageContainer);
	}
	
	setTimeout(function(){
		$(window).trigger('resize');
	}, 5000);
	
	var isFilterPanelOpend = false;
	
	$('.extended-filter-panel-click').click(function() {
		if (isFilterPanelOpend) {
			isFilterPanelOpend = false;

			$('.extended-filter-panel').hide();
			$('#icon-filter-toggle').removeClass('fa-caret-up').addClass('fa-tasks');
		}
		else {
			isFilterPanelOpend = true;

			$('.extended-filter-panel').show();
			$('#icon-filter-toggle').removeClass('fa-tasks').addClass('fa-caret-up');
		}
	});
	
});