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
      console.log(rehearsalObj)
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
 return `<td>${this.time.strftime("%B %-d, %Y")} at ${this.time.strftime("%k:%M")}</td>`
}

Rehearsal.prototype.getVenue = function() {
  return `<td>${this.venue}</td>`  
}


