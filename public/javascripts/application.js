$(document).ready(function(){
  
  if ($('.datepicker').length > 0) {
    $('.datepicker').datepicker();
  }

  $(".autocomplete").autocomplete({
    source: "/friends/autocomplete.json",
    minLength: 0
  });


  $('.notice, .alert').hide().fadeIn(3000);

});