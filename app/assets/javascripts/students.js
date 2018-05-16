$(document).ready(() => {
  attachStudentListeners()
})

function attachStudentListeners() {
  $("a#load-more").on("click", function(event) { 
    let last_id = $('tr.student-record').last().attr('data-id');
    const url = `${this.href}?id=${last_id}`

    loadMoreStudents(url);
    
    event.preventDefault();
  })
  
  $('#new_student').on('submit', function(event) {
    $.post(this.action, $(this).serialize())
      .done(function(response) {
        let newStudent = new Student(response['data']);
        $('fieldset').html("")
        let newStudentPage = newStudent.showNewStudentPage()
        $('div#new-student-js').append(newStudentPage)
      })
    
    event.preventDefault()
  })
}

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
  
  $(studentRow).insertBefore('#tr-load-more');
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

Student.prototype.renderStudentRow = function() {
  return `<tr class="student-record" data-id="${this.id}">
            <td>${this.name}</td>
            <td>${this.email}</td>
            <td><a href="/students/${this.id}">View</a></td>
            <td><a href="/students/${this.id}/edit">Edit</a></td>
            <td>
              <button id=studentid-${this.id}>Delete</button>
            </td>
          </tr>`
}

Student.prototype.showNewStudentPage = function() {
  return `<fieldset>
          <legend><h2>Student Info</h2></legend>
            <table>
              <tr>
                <td><strong>Name</strong></td>
                <td>${this.name}</td>
              </tr>
              <tr>
                <td><strong>Email</strong></td>
                <td>${this.email}</td>
              </tr>
            </table>
          </fieldset>`
}