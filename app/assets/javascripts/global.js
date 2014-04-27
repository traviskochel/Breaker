(function($){
  var BR = {
    init: function(){
      BR.tooltips();
    },

    tooltips: function(){
        $('.tooltip, .truncate').tooltip(
          {
            position: {  
              my: "center bottom", 
              at: "center top-10", 
              collision: "flipfit",
              using: function( position, feedback ) {
                  $( this ).css( position );
                  $( "<div class='tooltip-arrow'>" )
                  .addClass( feedback.vertical )
                  .addClass( feedback.horizontal )
                  .appendTo( this );
              } 
            }, 
          
            show: { 
              effect: "fade", 
              duration: 1, 
              delay: 650 
            }, 
          
            hide: { 
              effect: "fade", 
              duration: 1 
            }
          }
        );
        
        $(".tooltip.dark-tooltip" ).tooltip( "option", "tooltipClass", "dark-tooltip" );

        $(".truncate").tooltip("option", "tooltipClass", "truncated-tooltip"); 

        $('.truncate').each(function() {
          $(this).attr('title', $(this).text());
        });

        $(".truncate").tooltip({ disabled: true });

        $('.truncate').on('mouseenter', function(){
            var $this = $(this);
            if(this.offsetWidth < this.scrollWidth){
              $(this).tooltip({ disabled: false });
              $(this).tooltip("open");
            }
        });   
    }
    
  };

  window.BR = BR;
})(jQuery);

$(document).ready(BR.init);
$(document).on('page:load', BR.init);

$(window).load(function() {
  $('.page-loading').removeClass('page-loading');
});


