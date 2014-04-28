(function($){
  var BR_forms = {
    init: function(){
      BR_forms.deleteFields();
      BR_forms.linkSubmits();
      BR_forms.submitFromAnywhere();
      BR_forms.characterCountdown();
      BR_forms.openFileBrowser();
      BR_forms.submitOnEnterKey();
      BR_forms.ajaxStatuses();
    },

    linkSubmits: function(){
      $('body').on('click', 'a.submit', function(){
        $(this).closest('form').submit();
        return false;
      });
      $('body').on('click', 'a.submit-far-away', function(){
        $(this).closest('.form-far-away-wrap').find('.form-far-away').submit();
        $(this).attr('disabled', 'disabled');
        return false;
      });
    },
    submitFromAnywhere: function(){
      $('body').on('click', '.submit-from-anywhere-trigger', function(){

        //console.log($(this).closest('.user_id'))

        var target = $('.submit-from-anywhere');
        if ($(this).hasClass('submit-and-exit')){
          if (target.size()> 0) {
            target.data('remote', 'true');
            target.submit();

            target.on('ajax:success',    function(xhr, data, status) {
               window.location = '/';
            });

            target.on('ajax:error',    function(xhr, data, status) {
              //alert("Your form could not be saved. Please ensure you’ve filled out all the information below before exiting");
              target.unbind();
              target.removeData("remote");
              target.submit();
            });
          } else {
            window.location = '/';
          }

        } else {
          target.submit();
        }
        
        
        return false;
      });
    },
    addFields: function(link, association, content){
      var new_id = new Date().getTime();
      var regexp = new RegExp("new_" + association, "g");
      $(link).closest('li').before(content.replace(regexp, new_id));
      return false;
    },
    deleteFields: function() {
      $('body').on('click', '.delete-field', function(){
        var field = $(this).closest('.add-field-wrap');
        field.find('.delete-target').val('true');
        field.fadeOut(200);
        return false;
      });
    },
    characterCountdown: function(){
      $('.char-countdown').each(function(){
        var input = $(this);
        var max = input.data('maxlength');
        var length = max - input.val().length;
        var overClass = '';

        if (length < 0) {
          overClass = ' red overflowing';
        }

        var template = "<div class='char-countdown-counter text-right " + overClass + "'>" + length +"</div>";
        $(template).insertAfter(input);
      });
      
      $('.char-countdown').on('input', function() {
          var input = $(this);
          var counter = input.next('.char-countdown-counter');
          var max = input.data('maxlength');
          var length = max - input.val().length;
          if (length < 0) {
            counter.addClass('red overflowing');
          } else {
            counter.removeClass('red overflowing');
          }

          counter.text(length);
      });
    },

    openFileBrowser: function(){
      $('body').on('click', '.open-file-browser-trigger', function(){
        console.log('opening file chooser')
        var wrapper = $(this).closest('.open-file-browser-parent');
        // form.show();
        $('.open-file-browser', wrapper).trigger('click');
      });

      $('.open-file-browser').on('change',function(){
        console.log('adding filename')
        var fileName = $(this).val().replace(/C:\\fakepath\\/i, '');
        $(this).closest('.open-file-browser-parent').addClass('has-file').find('.open-file-browser-filename').text(fileName);
      });
    },

    submitOnEnterKey: function(){
      //-----------------------------------------------------
      //submit form from enter in textbox with class --------
      //-----------------------------------------------------
      $('input').focus(function() {
          $('.form-focus').removeClass('form-focus');
          $(this).closest('form').addClass('form-focus'); 
      });
      
      $(".final-enter").keypress(function(e) {
          if (e.which == 13) {
              e.preventDefault();
              $(".form-focus").submit();
          }
      });

    },

    ajaxStatuses: function(){
      $('form').on('ajax:beforeSend',    function(xhr, data, status) {
        $(this).addClass('submitting');
        //console.log('beforeSend');
      });
      $('form').on('ajax:complete',    function(xhr, data, status) {
        $(this).removeClass('submitting');
        //check to make sure disabled submits aren't being manually disabled elsewhere
        $('.submit, .submit-far-away').not('.stay-disabled').removeAttr('disabled');
      });
      $('form').on('ajax:success',    function(xhr, data, status) {
        $(this).addClass('success');
        //console.log('success');
      });
      $('form').on('ajax:error',    function(xhr, data, status) {
        $(this).addClass('error');
        //console.log('error');
      });
    }

    

  }
  window.BR_forms = BR_forms;
})(jQuery);


$(document).ready(BR_forms.init);
$(document).on('page:load', BR_forms.init);
