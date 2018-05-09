$(document).ready(function() {
  $('a#load_rehearsals').one("click", function(event) {
    event.preventDefault();
    
    const rehearsalsUrl = $('a#load_rehearsals').attr("href");
    
    loadRehearsals(rehearsalsUrl);
    $('a#load_rehearsals').attr("href", "#").on("click", function(event) {
      event.preventDefault();
    });
  });  
});

function loadRehearsals(url) {
  $.get(url).success(function(rehearsals) {
    rehearsals["data"].forEach(function(rehearsal) {
      createRehearsalRow(rehearsal);
    });
  });
}

function createRehearsalRow(rehearsalJson) {
  let rehearsal = new Rehearsal(rehearsalJson);
  let rehearsalRow = rehearsal.renderRehearsalRow();
  
  $('#rehearsals').append(rehearsalRow);
}

function Rehearsal(rehearsalJson) {
  this.id = rehearsalJson.id;
  this.time = new Date(rehearsalJson.attributes.time);
  this.venue = rehearsalJson.attributes.venue;
}

Rehearsal.prototype.getId = function() {
  return `${this.id}`
}

Rehearsal.prototype.getTime = function() {
let months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
console.log(this.time);
return `<td>${months[this.time.getMonth()]} ${this.time.getDate()}, ${this.time.getFullYear()}</td>`
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
