<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'content.label', default: 'Content')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
		
		<asset:stylesheet src="create.css"/>
		<asset:stylesheet src="category_sidemenu.css"/>
		
		<asset:javascript src="content_create.js"/>
		<asset:javascript src="jquery.form.min.js"/>
		<asset:javascript src="category_menu.js"/>
		
        <sec:ifLoggedIn>
            <meta name="url2redirect" content="${createLink(controller: 'content', action: 'personal')}">
        </sec:ifLoggedIn>
        <sec:ifNotLoggedIn>
            <meta name="url2redirect" content="${createLink(controller: 'content', action: 'shorten')}">
        </sec:ifNotLoggedIn>

        <meta name="contentId" content="${contentInstance.id}" />

	</head>
	<body>
        <div class="main-container">
        	<div class="content-editing-title">
				<span class="title-text">編輯內容 Post Content</span>
                <sec:ifNotLoggedIn>
                	<span class="label label-warning anonymous-tag">匿名模式</span>
                </sec:ifNotLoggedIn>
            </div>
        	<!-- 
        	<div id="content-editing-textarea" class="content-editing-textarea form-control" placeholder="Write something here..." contenteditable="true"></div>
        	 -->
        	
        	<g:textArea id="content-editing-textarea" class="content-editing-textarea form-control" name="text" placeholder="Write something here..." rows="15" value="${contentInstance.fullText}" />

        	<div id="PictureContainer" class="content-editing-picture">
        		<div class="picture-cell">

                    <g:each in="${contentInstance.pictureSegments}" var="pictureSegment">
                        <div id="ajax-upload-display-${new java.util.Date().time}" class="picture-block" style="background-image: url(${pictureSegment.s3File.url})"></div>
                    </g:each>

        			<div class="picture-add" style="display: none">
        				<span class="fa fa-plus" style="font-size:large;"></span>
        			</div>
        		</div>
        	</div>
        	
        	<div class="content-editing-category">
        		<div class="category-cell">

                    <g:each in="${contentInstance.categories}" var="category">
                        <div id="category-${category.name}" class="category-item">${category.name}</div>
                    </g:each>

                    <div class="category-add" onclick="showCategoryMenu()" style="display: none">
                        <span class="fa fa-plus" style="font-size:large;"></span>
                        內容類別
                    </div>

        		</div>
        	</div>

            <!--
            <div>
                <g:textField name="references" value="" placeholder="http://" class="form-control" />
            </div>
            -->

        	<div class="button-block">
        		<div style="width: 60%">
        		</div>
        		<div style="width: 10%" class="btn-item">
					<g:link class="koobe-text-btn koobe-text-btn-inverse" uri="javascript:cancelPost();" >取消 Cancel</g:link>
        		</div>
        		<div style="width: 30%" class="btn-item">
					<g:link id="button-post" class="koobe-text-btn koobe-text-btn-default" uri="javascript: postContent();">更新 Update</g:link>
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
        
        <g:include controller="category" action="addCategoryPanel" params="[btnaction: 'create']" />
	</body>
</html>