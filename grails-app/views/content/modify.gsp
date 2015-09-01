<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName" value="${message(code: 'content.label', default: 'Content')}" />
<title><g:message code="default.create.label" args="[entityName]" /></title>

<asset:stylesheet src="create.css"/>
<asset:stylesheet src="category_sidemenu.css"/>

<asset:javascript src="jquery/jquery.paste_image_reader.js" />
<asset:javascript src="content/content_create.js"/>

<asset:javascript src="jquery.form.min.js"/>
<asset:javascript src="category_menu.js"/>

<asset:javascript src="e7read.geolocation.js"/>

<sec:ifLoggedIn>
    <meta name="url2redirect" content="${createLink(controller: 'content', action: 'personal')}">
</sec:ifLoggedIn>
<sec:ifNotLoggedIn>
    <meta name="url2redirect" content="${createLink(controller: 'content', action: 'shorten')}">
</sec:ifNotLoggedIn>

<meta name="contentId" content="${contentInstance.id}" />
<meta name="params-channel" content="${contentInstance.channel.name}" />

<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?key=${grailsApplication.config.google.api.key}&sensor=false"></script>

<style>
#map-canvas { width: 100%; height: 320px }
</style>
</head>
<body>
<div class="main-container" onclick="hideCategoryMenu();">
    <div style="text-align: center;">
        <div class="content-editing-title">
            <div style="display:table-cell; background-color: #89E2D5; height: 30px; padding: 0px 20px 0px 10px;">
                <span class="title-text"><g:message code="content.create.title" /></span>
            </div>
            <img src="/assets/arrow_30.png" class="">
            <sec:ifNotLoggedIn>
                <span class="anonymous-tag">匿名模式</span>
            </sec:ifNotLoggedIn>
        </div>
    </div>
    <!--
    <div id="content-editing-textarea" class="content-editing-textarea form-control" placeholder="Write something here..." contenteditable="true"></div>
     -->

    <g:textArea id="content-editing-textarea" class="content-editing-textarea form-control" name="text" placeholder="Write something here..." rows="15" value="${contentInstance.fullText}" />

<g:render template="editing_tips" />

    <g:if test="${params.channel == 'trade'}">
        <div class="row">
            <div class="col-sm-4">
                <form class="form-inline text-left">
                    <div class="form-group">
                        <label>Price：</label>
                        <input id="trading-value" type="text" class="form-control" placeholder="Enter number" value="${contentInstance.tradingContentAttribute?.price}" />
                    </div>
                </form>
            </div>
            <div class="col-sm-8">
                <form class="form-inline text-left">
                    <div class="form-group">
                        <label>Post date from：</label>
                        <input id="validateDateBegin" type="text" class="form-control" value="${formatDate(date: contentInstance.validateDateBegin, format: 'yyyy-MM-dd')}" />
                    </div>
                    <div class="form-group">
                        <label>to</label>
                        <input id="validateDateEnd" type="text" class="form-control" value="${formatDate(date: contentInstance.validateDateEnd, format: 'yyyy-MM-dd')}" />
                    </div>
                </form>
            </div>
        </div>
    </g:if>

    <div id="PictureContainer" class="content-editing-picture">
        <div class="picture-cell">

            <g:each in="${contentInstance.pictureSegments}" var="pictureSegment">
                <g:set var="uploadId" value="ajax-upload-display-${new java.util.Date().time}" />
                <div id="${uploadId}" class="picture-block" style="background-image: url(${pictureSegment.s3File?.url})" data-upload-id="${uploadId}" data-s3file-id="${pictureSegment.s3File?.id}"></div>
            </g:each>

            <div class="picture-add" style="display: none">
                <span class="fa fa-plus" style="font-size:large;"></span>
            </div>
        </div>
    </div>

    <div class="content-editing-category">
        <div class="category-cell">

            <g:each in="${contentInstance.categories}" var="category">
                <div id="category-${category.name}" class="category-item" data-category-name="${category.name}">
                    <g:message code="category|${category.name}" default="${category.name}" />
                </div>
            </g:each>

            <div class="category-add" onclick="showCategoryMenu()" style="display: none">
                <span class="fa fa-bookmark" style="font-size:large;"></span>
                類別
            </div>

        </div>
    </div>

    <!--
    <div>
        <g:textField name="references" value="" placeholder="http://" class="form-control" />
    </div>
    -->
    
    <div style="text-align: left; padding: 0px 0px 0px 0px;">
    	<input type="hidden" name="lat" value="${contentInstance.location?.lat}" />
        <input type="hidden" name="lon" value="${contentInstance.location?.lon}" />
        <input type="hidden" name="geolocation" value="${contentInstance.location?.lat},${contentInstance.location?.lon}" />
        
    	<div style="display:inline-block; padding: 10px 0px 0px 0px;">
			<span>所在位置</span>
            &nbsp;
            <g:link controller="map" action="prompt" class="location-link" target="_blank">
                <i class="fa fa-map-marker"></i>
                <span id="locationDisplayName">${contentInstance.location?.city?:'地點未設定'}</span>
            </g:link>
            &nbsp;
            <div class="btn-group" data-toggle="buttons" style="display: inline-block">
                <label class="btn btn-default ${contentInstance.isShowLocation?'active':''}">
                    <input type="radio" name="isShowLocation" id="isShowLocation1" value="true" autocomplete="off" ${contentInstance.isShowLocation?'checked':''} />
                    顯示
                </label>
                <label class="btn btn-default ${contentInstance.isShowLocation?'':'active'}">
                    <input type="radio" name="isShowLocation" id="isShowLocation2" value="false" autocomplete="off" ${contentInstance.isShowLocation?'':'checked'} />
                    隱藏
                </label>
            </div>
		</div>
    	<div style="display:inline-block; float:right; padding: 10px 0px 0px 0px;">
	    	<div style="display:inline-block;" class="btn-item">
	            <g:link id="button-post-cancel" class="koobe-text-btn koobe-text-btn-inverse" style="width:90px;" uri="javascript:cancelPost();" ><g:message code="default.button.cancel.label" /></g:link>
	        </div>
            <div style="display:inline-block;" class="btn-item">
                <g:link controller="content" action="pullOff" id="${contentInstance.id}" class="koobe-text-btn koobe-text-btn-inverse" style="width: 90px"><g:message code="default.button.pullOff.label" /></g:link>
            </div>
	        <div style="display:inline-block;" class="btn-item">
	            <g:link id="button-post" class="koobe-text-btn koobe-text-btn-default" style="width:90px;" uri="javascript: postContent(true);"><g:message code="default.button.save.label" />></g:link>
	        </div>
        </div>
    </div>

    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${contentInstance}">
        <ul class="errors" role="alert">
            <g:eachError bean="${contentInstance}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
            </g:eachError>
        </ul>
    </g:hasErrors>
</div>
<br />
<br />

<g:uploadForm class="uploadImageForm" name="uploadImageForm" action="uploadImage" style="display: none;">
    <input id="uploadImageInput" type="file" accept="image/*" name="file" />
</g:uploadForm>

<g:render template="/home/footer" />

<g:include controller="category" action="addCategoryPanel" params="[btnaction: 'create', channel: contentInstance.channel?.name]" />

<script type="application/javascript">
$(function() {
    $('input[name=geolocation]').change(function() {
        console.log('change location.');
        var geolocation = $(this).val();
        $.geoupdate({
            lat: $('input[name=lat]').val(),
            lon: $('input[name=lon]').val(),
            callback: function(data) {
                $('#locationDisplayName').text(data.display);
            }
        });
    });
});
</script>
</body>
</html>