$(document).ready ->
  $('#lesion_location_other').focusin ->
    $('#biopsy_lesion_location_other').prop("checked", true)
    console.log($('input[name="biopsy[lesion_location]"]:checked')[0].value)

  $(':radio.as_checkbox').mousedown (e) ->
    the_radio = $(this)
    if the_radio.is(':checked')
      uncheck = ->
        setTimeout ( -> the_radio.removeAttr('checked') ), 0
      unbind = ->
        the_radio.unbind('mouseup', up)
      up = ->
        uncheck()
        unbind()
      the_radio.bind('mouseup', up)
      the_radio.one('mouseout', unbind)

  $('label:has(.as_checkbox)').mousedown (e) ->
    the_radio = $(this).children().first()
    if the_radio.is(':checked')
      uncheck = ->
        setTimeout ( -> the_radio.removeAttr('checked') ), 0
      unbind = ->
        $(this).unbind('mouseup', up)
      up = ->
        uncheck()
        unbind()
      $(this).bind('mouseup', up)
      $(this).one('mouseout', unbind)
