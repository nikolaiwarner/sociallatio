$(document).ready(function(){
  
  $('.datetimepicker').datepicker();

  $(".autocomplete").autocomplete({
    source: "/friends/autocomplete.json",
    minLength: 0
  });


  $('.notice, .alert').hide().fadeIn(3000);

});