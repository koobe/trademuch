<!DOCTYPE html>
<g:applyLayout name="template_trade">
<html>
	<head>
	    <meta name="kgl:media_count" content="3"/>
	    <meta name="kgl:text_count" content="1"/>
	    <meta name="kgl:grouping" content="trade"/>
	</head>
	<body>

		<div class="container">
	
			<div class="margin-blank"></div>
	
			<template:imageTitle content="${content}" classOfImage="bg-mask-left" classOfTitle="" styleOfTitle="" />
			
			<div class="margin-blank"></div>
			
			<div class="border-btm">
				<div style="display:table; width:100%;">
				    <div class="content-author" style="display:table-cell;">
				        <span class="author-click" data-user-id="${content.user.id}">${content.user.fullName}</span>
				    </div>
				
				    <div class="content-author" style="display:table-cell; text-align: right;">
				        <span style="font-size: 0.7em; color: #333;"><g:formatDate date="${content.datePosted}" format="yyyy/MM/dd HH:mm:ss"/></span>
				    </div>
				</div>
			</div>
			
			<div class="">
		        <g:if test="${content.categories}">
		        	<template:categoriesTable content="${content}" />
		        </g:if>
	            <template:socialToolbar content="${content}" />
		    </div>
		    
		    <div class="margin-blank"></div>
		    
		    <!-- texts of content -->
			<template:containerTexts content="${content}" />
		    
		    <template:sectionTitle title="相片" />
		    
		    <template:containerPicturesType1 content="${content}" />
		
		    <div class="margin-blank"></div>
		    
		    <template:sectionTitle title="地圖" />
		    
			<div style="width: 100%;">
		    	<img style="max-width: 100%;" src="http://maps.googleapis.com/maps/api/staticmap?center=${content.location?.lat},${content.location?.lon}&zoom=14&size=960x250&scale=2&sensor=false" alt="google map" border="0" class="img-thumbnail"/>
		    </div>
		    
		    <div class="margin-blank"></div>
		    
		    <template:sectionTitle title="留言" />
		    
		    <div>
		    	<fb:comments contentid="${content.id}" />
		    </div>
	    
		</div>
		
	</body>
</html>
</g:applyLayout>