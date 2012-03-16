/**
* Star Rating - jQuery plugin
*
* Copyright (c) 2007 Wil Stuckey
* Modified by John Resig
* Additional modifications by Tim Hobbs - http://hobbscene.com
*
* Dual licensed under the MIT and GPL licenses:
*   http://www.opensource.org/licenses/mit-license.php
*   http://www.gnu.org/licenses/gpl.html
*
*/

/**
* Create a degradeable star rating interface out of a simple form structure.
* Returns a modified jQuery object containing the new interface.
*   
* @example jQuery('form.rating').rating();
* @cat plugin
* @type jQuery 
*
*/
(function($) {

    $.fn.starrating = function(options) {

        var options = $.extend({}, $.fn.starrating.options, options || {});

        return this.each(function() {

            // build element specific options
            var o = $.meta ? $.extend({}, options, $this.data()) : options;

            var url = this.action, averageRating, averageIndex, averagePercent;

            init(this);

            var div = $("<div/>").attr({
                title: this.title,
                className: "rating"
            }).insertAfter(this);

            $(this).find("select option").each(function() {
                div.append(this.value == "0" ?
                "<div class='cancel'><a href='#0' title='Cancel Rating'>Cancel Rating</a></div>" :
                "<div class='star'><a href='#" + this.value + "' title='Give it a " +
                    this.value + " Star Rating'>" + this.value + "</a></div>");
            });

            var stars = div.find("div.star");
            var cancel = div.find("div.cancel");

            disabled = $(this).find("select").is(":disabled") || o.disabled;

            if (!disabled) {
                stars.mouseover(drainFill).focus(drainFill)
                .mouseout(drainReset).blur(drainReset)
                .click(click);

                cancel.mouseover(drainAdd).focus(drainAdd)
                .mouseout(resetRemove).blur(resetRemove)
                .click(click);
            } else {
                readOnly(this);
            }

            reset();

            function init(elem) {
                averageRating = $(elem).attr("title").split(/:\s*/)[1].split("."),
                averageIndex = averageRating[0],
                averagePercent = averageRating[1];
            }

            function drainFill() { drain(); fill(this); }
            function drainReset() { drain(); reset(); }
            function resetRemove() { reset(); $(this).removeClass("on"); }
            function drainAdd() { drain(); $(this).addClass("on"); }

            function readOnly(elem) {
                stars.unbind();
                cancel.unbind();
                $(elem).css("cursor", "default");
                elem.find("a").each(function() {
                    var title = $(this).attr("title");
                    var rated = "Average Rating: " + averageIndex;
                    $(this).attr("title", title.replace("Give it a " + this.href.split("#")[1] + " Star Rating", rated).replace("Cancel Rating", rated));
                    $(this).css("cursor", "default");
                    $(this).hover(function() {
                        if ($(this).parent().hasClass("on")) {
                            $(this).css("background-position", o.position);
                        } else {
                            $(this).css("background-position", "inherit");
                        }
                    });
                    $(this).click(function(e) {
                        e.preventDefault();
                    });
                });
            }

            function click() {
                if (stars.index(this) == -1 && !o.cancelSubmit)
                    return false;

                averageIndex = stars.index(this) + 1;
                averagePercent = 0;

                if (averageIndex == 0)
                    drain();

                var data = { rating: $(this).find('a')[0].href.split("#")[1] };

                $.ajax({
                    type: "POST",
                    url: url,
                    data: data,
                    dataType: "text",
                    success: o.success,
                    complete: function(xml, txt) {
                        var rating = $("div.rating");
                        init(rating);
                        drainReset();
                        if (o.disableOnSubmit) {
                            readOnly(rating);
                        }
                    }
                });

                return false;
            }

            // fill to the current mouse position.
            function fill(elem) {
                stars.find("a").css("width", "100%");
                $(stars[stars.index(elem) - 1]).prevAll().andSelf().filter("div.star").addClass("hover");
            }

            // drain all the stars.
            function drain() {
                stars.removeClass("on hover");
            }

            // Reset the stars to the default index.
            function reset() {
                $(stars[averageIndex - 1]).prevAll().andSelf().filter("div.star").addClass("on");

                var percent = averagePercent ? averagePercent * 10 : 0;
                if (percent > 0)
                    $(stars[averageIndex]).addClass("on").children("a").css("width", percent + "%");
            }
        }).remove();
    };
    // fix ie6 background flicker problem.
    if ($.browser.msie) try { document.execCommand("BackgroundImageCache", false, true) } catch (e) { };

    $.fn.starrating.options = {
        cancelSubmit: true,
        disabled: false,
        position: "-16px -16px",
        success: function() {
            alert("Success!");
        },
        disableOnSubmit: false
    };

})(jQuery);