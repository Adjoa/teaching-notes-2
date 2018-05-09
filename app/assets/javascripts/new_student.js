$(document).on('turbolinks:load', function() {
  $('#new_student').on('submit', function(event) {
    event.preventDefault()
    
    $.ajax({
      type: this.method,
      url: this.action,
      data: $(this).serialize(),
      success: function(response) {
        console.log(response);
        // renderStudentPage()
      }
    })
  })
})

