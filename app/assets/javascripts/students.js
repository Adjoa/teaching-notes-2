$(document).ready(() => {
  $("a#load-more").on("click", function(e) { 
    e.preventDefault(); 
    
    let last_id = $('tr.student-record').last().attr('data-id');
    const url = `${this.href}?id=${last_id}`
    console.log(url)
    
    $.ajax({
      method: "GET",
      url: url,
    }).success(function( json ) {
      // $('#tr-load-more').hide()
      
      json['data'].forEach(function(studentJson) {
        let student = new Student(studentJson)
        let studentRow = student.renderStudentRow()
        
        $('tbody').append(studentRow)
        
        $(`button#studentid-${student.id}`).click(function(event) {
          event.preventDefault()
          
          $.ajax({
            method: "DELETE",
            url: `/students/${student.id}`
          }).done(function() {
              console.log("Student record deleted");
              $(`[data-id=${student.id}]`).hide();
            });
        })
      });
    });
  })
})


function Student(studentJson) {
  this.id = studentJson.id;
  this.name = studentJson.attributes.name;
  this.email = studentJson.attributes.email;
}

Student.prototype.getId = function() {
  return `${this.id}`
}

Student.prototype.getName = function() {
  return `<td>${this.name}</td>`
}

Student.prototype.getEmail = function() {
  return `<td>${this.email}</td>`
}

Student.prototype.renderStudentRow = function() {
  return '<tr class="student-record" data-id="' + this.getId() + '">' +
  this.getName() +
  this.getEmail() +
  '<td><a href="/students/' + this.getId() + '">View</a></td>' +
  '<td><a href="/students/' + this.getId() + '/edit">Edit</a></td>' +
  '<td>' +
  '<button id=studentid-' + this.getId() + '>' + 'Delete' + '</button>' +
  '</td>' +
  '</tr>'
}