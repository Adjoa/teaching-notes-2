$(document).ready(function() {
  $("a#load-more").on("click", function(event) { 
    event.preventDefault(); 
    
    let last_id = $('tr.student-record').last().attr('data-id');
    const url = `${this.href}?id=${last_id}`

    loadMoreStudents(url);
  })
  
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

function loadMoreStudents(url) {
  $.get(url).success(function( students ) {
    students['data'].forEach(function(student) {
      createNewStudentRow(student);
    });
  });
}

function createNewStudentRow(studentJson) {
  let student = new Student(studentJson);
  let studentRow = student.renderStudentRow();
  
  $('tbody').append(studentRow);
  addDeleteEventListener(student.id);
}

function addDeleteEventListener(studentId) {
  $(`button#studentid-${studentId}`).click(function(event) {
    event.preventDefault()
    
  $.ajax({
    method: "DELETE",
    url: `/students/${studentId}`
  }).done(function() {
      $(`[data-id=${studentId}]`).remove();
    });
  });
}

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