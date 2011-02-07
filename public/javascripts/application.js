$(document).ready(function(){
  
  $('.datetimepicker').datetimepicker();

  $(".autocomplete").autocomplete({
    source: "autocomplete.js",
    minLength: 3
  });


});