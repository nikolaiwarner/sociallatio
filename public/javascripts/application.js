$(document).ready(function(){
  
  if ($('.datepicker').length > 0) {
    $('.datepicker').timepicker();
  }

  $(".autocomplete").autocomplete({
    source: "/friends/autocomplete.json",
    minLength: 0
  });


  $('.notice, .alert').hide().fadeIn(3000);

});