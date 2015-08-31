function recursiveLinkify(element, match, replacer, groupCount) {

    // For each content node in the given element,
    $.each(
        element.contents(),
        function(index, element) {
            element = $(element);

            // Replace it's content if it's a text node
            if (element.get(0).nodeType == document.TEXT_NODE) {
                var fetch_plain = true;
                var groups = element.text().split(match);
                var result = "";
                for (var i=0; i<groups.length; i++) {
                    if (fetch_plain) {
                        result += htmlEncode(groups[i]);
                        fetch_plain = false;
                    } else {
                        result += replacer(groups[i]);
                        i += groupCount - 1;
                        fetch_plain = true;
                    }
                }
                element.after(result).remove();
            }

            // Or recurse down into it if it's not an anchor or a button
            else if (element.prop("tagName") != "A" && element.prop("tagName") != "BUTTON") {
                recursiveLinkify(element, match, replacer, groupCount);
            }
        }
    );
}


function htmlEncode(text) {
    return $("<div />").text(text).html();
}


(function($) {
    $.fn.linkify = function(opts) {
        return this.each(function() {

            // Regex from http://daringfireball.net/2010/07/improved_regex_for_matching_urls
            var matchURLs = /\b((?:https?:\/\/|www\d{0,3}[.]|[a-z0-9.\-]+[.][a-z]{2,4}\/)(?:[^\s()<>]+|\(([^\s()<>]+|(\([^\s()<>]+\)))*\))+(?:\(([^\s()<>]+|(\([^\s()<>]+\)))*\)|[^\s`!()\[\]{};:'".,<>?«»“”‘’]))/ig;
            var groupCount = "-- http://example.com --".split(matchURLs).length - 2;
            var replaceURLs = function(str) {
                return "<a href='"+(str.indexOf("://") === -1 ? "http://" : "")+str+"'>"+str+"</a>";
            }
            recursiveLinkify($(this), matchURLs, replaceURLs, groupCount);

            // Regex from http://www.regular-expressions.info/email.html
            var matchEmails = /\b([a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?)/ig;
            var groupCount = "-- test@example.com --".split(matchEmails).length - 2;
            var replaceEmails = function(str) {
                return "<a href='mailto:"+str+"'>"+str+"</a>";
            }
            recursiveLinkify($(this), matchEmails, replaceEmails, groupCount);

            // Simple URLs that weren't otherwise caught by the above
            var matchDomains = /\b([a-z0-9.\-]+[a-z0-9][.][a-z]{2,4})\b/ig;
            var groupCount = "-- example.com --".split(matchDomains).length - 2;
            var replaceDomains = function(str) {
                return "<a href='"+(str.indexOf("://") === -1 ? "http://" : "")+str+"'>"+str+"</a>";
            }
            recursiveLinkify($(this), matchDomains, replaceDomains, groupCount);
        });
    }
})(jQuery);
