$(document).on('turbolinks:load', function(){
  $('a#load_rehearsals').on("click", function(event) {
    event.preventDefault();
    
    const rehearsalsUrl = $('a#load_rehearsals').attr("href");
    
    loadRehearsals(rehearsalsUrl);
  });  
});

function loadRehearsals(url) {
  $.get(url).success(function(rehearsals) {
    rehearsals["data"].forEach(function(rehearsal) {
      let rehearsalObj = new Rehearsal(rehearsal);
      let rehearsalRow = rehearsalObj.renderRehearsalRow();
      
      $('#rehearsals').append(rehearsalRow);
    });
  });
}

function Rehearsal(rehearsalJson) {
  this.id = rehearsalJson.id;
  this.time = rehearsalJson.attributes.time;
  this.venue = rehearsalJson.attributes.venue;
}

Rehearsal.prototype.getId = function() {
  return `${this.id}`
}

Rehearsal.prototype.getTime = function() {
// return `<td>${this.time} at ${this.time}</td>`
return `<td>${this.time}</td>`
}

Rehearsal.prototype.getVenue = function() {
  return `<td>${this.venue}</td>`  
}

Rehearsal.prototype.renderRehearsalRow = function() {
  return '<tr>' +
  '<td><a href="/rehearsals/' + this.getId() + '"> View Rehearsal</a></td>' +
  this.getTime() +
  this.getVenue() +
  '</tr>'
}
