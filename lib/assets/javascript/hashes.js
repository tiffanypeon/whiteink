(function( $ ){

    $.fn.tweetLinks = function() {

        this.each(function() {

            var $this = $(this);
            var string = $this.html();
            var hashtag_regex = /[#]+[A-Za-z0-9-_]+/g;

            var tweet = string.replace(hashtag_regex, function( hashtag ){
                var idd = hashtag.replace('#','');
                return '<span class="hashtag" id='+ idd +'>'+ hashtag +'</span>';
            });

            $this.html( tweet );

            // return this;

        });
    };

})( jQuery );
