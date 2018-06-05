
  percent_deadlines = $('#percent_deadlines')

  percent_deadlines.on 'cocoon:after-insert', (e, added_el) ->
    added_el.find("input").first().focus();

  percent_deadlines.on 'cocoon:before-remove', (e, el_to_remove) ->
    $(this).data('remove-timeout', 1000)
    el_to_remove.fadeOut(1000)