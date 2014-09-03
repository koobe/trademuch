<!DOCTYPE html>
<html>
<head>
    <title>${content.cropTitle}</title>
    <meta name="kgl:media_count" content="3"/>
    <meta name="kgl:text_count" content="1"/>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" />
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet" />
    <asset:stylesheet src="default_template.css"/>

</head>
<body data-linkify="p, .plain-text">
    <div class="template-container">

        <div class="pictures-container">
            <table class="picture-rtable">
                <tr>
                  <td rowspan="2">
                    <div class="picture-native" style="background-image:url(${content.pictureSegments[0]?.originalUrl});" data-imageurl="${content.pictureSegments[0]?.originalUrl}"></div>
                  </td>
                  <td>
                    <div class="picture-native" style="background-image:url(${content.pictureSegments[1]?.originalUrl});" data-imageurl="${content.pictureSegments[1]?.originalUrl}"></div>
                  </td>
                </tr>
                <tr>
                  <td>
                    <div class="picture-native" style="background-image:url(${content.pictureSegments[2]?.originalUrl});" data-imageurl="${content.pictureSegments[2]?.originalUrl}"></div>
                  </td>
                </tr>
            </table>
        </div>

        <div class="title-container border-btm margin-lr-20">
            <div class="content-title">
                <h1>${content.cropTitle}</h1>
            </div>
            <div style="display:table; width:100%;">
                <div class="content-author" style="display:table-cell;">
                    <span>${content.user.fullName}</span>
                </div>
                <div class="content-author" style="display:table-cell; text-align: right;">
                    <span style="font-size: 0.7em; color: #333;"><g:formatDate date="${content.lastUpdated}" format="yyyy/MM/dd HH:mm:ss" /></span>
                </div>
            </div>
        </div>

        <div class="margin-lr-20">
            <g:if test="${content.categories}">
                <ul class="content-categories">
                    <g:each in="${content.categories}" var="category">
                        <li>
                            <a class="content-category" href="#" data-category-name="${category.name}">
                                <span class="category-name">
                                	<g:message code="category.name.i18n.${category.name}" default="${category.name}" />
                                </span>
                            </a>
                        </li>
                    </g:each>
                </ul>
            </g:if>
            <div class="pull-right social-toolbar">
                <g:if test="${content.references}">
                    <g:link uri="${content.references}" target="_blank">
                        <i class="fa fa-external-link"></i>
                        Source
                    </g:link>
                </g:if>
                <a href="https://www.facebook.com/sharer/sharer.php?u=${URLEncoder.encode(shareUrl, 'UTF-8')}" target="_blank">
                    <i class="fa fa-facebook-square"></i>
                    Share
                </a>
            </div>
        </div>

        <div class="margin-blank"></div>

        <div class="text-container padding-lr">
            <div>
                <g:each in="${content.textSegments}" var="segment">
                    <markdown:renderHtml>${segment.text}</markdown:renderHtml>
                </g:each>
            </div>
        </div>

        <div class="margin-blank"></div>

        <g:if test="${content.references}">
            <div class="text-references padding-lr" style="overflow: hidden; text-overflow:ellipsis; white-space: nowrap; color: #555;">
                <i class="fa fa-external-link"></i>
                <g:link uri="${createLink(uri: content.references)}" target="_blank">Source</g:link>
            </div>
        </g:if>

    </div>
    <g:render template="/home/footer" />

    <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
    <script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    <script src="//soapbox.github.io/jQuery-linkify/dist/jquery.linkify.min.js"></script>
    <asset:javascript src="default_template.js" />

<asset:stylesheet src="imageview.css"/>
<asset:javascript src="jquery.imageview.js"/>
<script type="text/javascript">
 $(function() {
 	$('.pictures-container').imageview({
		attrOfUrl: 'data-imageurl'
	  });
	 });
</script>
</body>
</html>
