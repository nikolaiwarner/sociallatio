window.sociallatio = 
  learning = 
    reveal_info: ->
      $(".hidden").fadeIn()




$(document).ready ->
  $(".notice, .alert").hide().fadeIn 3000
  $(".datepicker").timepicker()  if $(".datepicker").length > 0
  if $(".friendname_autocomplete").get(0)
    $(".friendname_autocomplete").bind "keydown", (event) ->
      event.preventDefault()  if event.keyCode == $.ui.keyCode.TAB and $(this).data("autocomplete").menu.active
    
    $(".friendname_autocomplete").autocomplete 
      source: (request, response) ->
        $.getJSON "/friends/autocomplete.json", term: request.term.split(/,\s*/).pop(), response
      
      search: ->
        term = @value.split(/,\s*/).pop()
        false  if term.length < 2
      
      focus: ->
        false
      
      select: (event, ui) ->
        terms = @value.split(/,\s*/)
        terms.pop()
        terms.push ui.item.value
        terms.push ""
        @value = terms.join(", ")
        false