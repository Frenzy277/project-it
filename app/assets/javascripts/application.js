//= require jquery
//= require jquery_ujs
//= require jquery-ui/datepicker
//= require_tree .
//= require bootstrap-sprockets

$(document).ready(function() {
  $("#Tealeaf").fadeIn(5000);

  $(".dropdown-menu li").hover(
    function(){
      $(this).addClass("active");
    },
    function(){
      $(this).removeClass("active");
    }
  );

  $("#date_picker-solo, #date_picker-team, #date_picker").datepicker({
    showAnim: "fadeIn",
    minDate: 0,
    dateFormat: "yy-mm-dd"
  });

  $('dd#likes').hover(function(){
    $(this).popover('toggle');
  });

  $(document).on('mouseenter mouseleave', 'span.mark-read', function(){
    $(this).popover('toggle');
  });

  $(document).on('mouseenter mouseleave', 'span.mark-delete', function(){
    $(this).popover('toggle');
  });


});
