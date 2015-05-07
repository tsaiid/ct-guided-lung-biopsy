$(document).ready ->
  $('#lesion_location_other').focusin ->
    $('#lesion_location_other_radio').prop("checked", true)
    console.log($('input[name="biopsy[lesion_location]"]:checked')[0].value)
