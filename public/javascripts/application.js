var sociallatio = {

  learning: {
    reveal_info: function() {
      $('.hidden').fadeIn();
    }
  }
  
};



$(document).ready(function(){
  // Notifications
  $('.notice, .alert').hide().fadeIn(3000);
  
  // Datepicker
  if ($('.datepicker').length > 0) {
    $('.datepicker').timepicker();
  }

  // Autocomplete
  $(".friendname_autocomplete")
    .bind( "keydown", function( event ) {
    	if ( event.keyCode === $.ui.keyCode.TAB &&
    			$( this ).data( "autocomplete" ).menu.active ) {
    		event.preventDefault();
    	}
    })
    .autocomplete({
    	source: function( request, response ) {
    		$.getJSON("/friends/autocomplete.json", {
    			term: request.term.split( /,\s*/ ).pop()
    		}, response );
    	},
    	search: function() {
    		var term = this.value.split( /,\s*/ ).pop();
    		if ( term.length < 2 ) {
    			return false;
    		}
    	},
    	focus: function() {
    		return false;
    	},
    	select: function( event, ui ) {
    		var terms = this.value.split( /,\s*/ );
    		terms.pop();
    		terms.push( ui.item.value );
    		terms.push( "" );
    		this.value = terms.join( ", " );
    		return false;
    	}
    });
});
