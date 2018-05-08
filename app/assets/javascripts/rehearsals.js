$(document).on('turbolinks:load', function(){
  $('a#load_rehearsals').on("click", function(event) {
    event.preventDefault();
    
    alert("Hello, world!"); 
  });  
})
