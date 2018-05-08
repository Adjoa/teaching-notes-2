$(document).on('turbolinks:load', function(){
  $('a#load_rehearsals').on("click", function(event) {
    event.preventDefault();
    
    const rehearsalsUrl = $('a#load_rehearsals').attr("href");
    
    $.ajax({
      method: "GET",
      url: rehearsalsUrl
    }).done(function(response) {
      console.log(response)
    });
  });  
});
