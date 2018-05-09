$(document).on('turbolinks:load', function() {
  $('#new_student').on('submit', function(event) {
    $.ajax({
      type: "POST",
      url: this.action,
      data: $(this).serialize(),
      success: function(response) {
        console.log(response)
        $('fieldset').html("")
        $('fieldset').append(response)
      }
    });
    
    event.preventDefault()
  })
})