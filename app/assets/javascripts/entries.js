$(document).on('turbolinks:load', function() {
  let studentId = $(".js-next").attr("student-id"); 
  let idsUrl = `/students/${studentId}/entries/ids`;
  let allIds = [];
  
  $.ajax({
    method: "GET",
    url: idsUrl
  }).done(function(json) {
    json['data'].forEach(function(entry) { 
      allIds.push(entry.id)
    });
  });
  
  $(".js-next").on("click", function(event) {
    event.preventDefault();
    
    let current = $(".js-next").attr("data-id"); 
    let currentIndex = allIds.indexOf(current);
    let nextIndex = currentIndex + 1;
    let next = current;
    
    if(nextIndex === allIds.length && allIds.length === 1) {
      alert("There is only 1 entry for this student.");
    } else if(nextIndex === allIds.length) {
      next = allIds[0];
    } else {
      next = allIds[nextIndex];
    }
  
    let nextUrl = `/students/${studentId}/entries/${next}/entry_data`;
    
    $.ajax({
      method: "GET",
      url: nextUrl
    }).done(function(entry_data) {
      $(".card-title").text(entry_data['data'].attributes.title);
      $(".card-text").text(entry_data['data'].attributes.content);
      $("#edit-btn").attr("href", `/students/${studentId}/entries/${entry_data['data'].id}`);
      $(".js-next").attr("data-id", entry_data['data'].id);
    });
  });
});