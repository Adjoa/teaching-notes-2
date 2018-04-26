$(document).ready(() => {
  $("a#load-more").on("click", function(e) { 
    // alert("You clicked this link!!!"); 
    //Fire some AJAX 
    e.preventDefault(); 
    let last_id = $('tr.student-record').last().attr('data-id');
    const url = `${this.href}?id=${last_id}`
    console.log(url)
    $.get(url, function(response) {
      console.log(response)
    });
    //GET a response
    
  })
})

var obj = {
  name: "Cernan",
  sayName: function() {
    console.log(this.name)
  }
}


// $(document).ready(() => {
//   attachListeners()
// });

// function attachListeners() {
//   $('a#load-more').on('click', getStudents)
// }

// function getStudents(e) {
//     // $('a#load-more').hide();
//     let last_id = $('tr.student-record').last().attr('data-id');
    
//     // $.get(this.href, { id: last_id }, function(response) {
//     //     console.log(response)
//     //   }, "json");

//     e.preventDefault();
//     const url = `${this.href}?id=${last_id}`
//     // $.get('/students.json', (studentRecords) => {
//     debugger;
//     $.get(url, (studentRecords) => {
//       debugger;
//       if(studentRecords.data.length) {
//         studentRecords.data.forEach(addStudent)
//       }
//     }).done(function() {
//       debugger;
//       console.log("Done!")
//     })
// }

// function addStudent(student) {
//   // $('#students').append(`<tr>Hello, world!</tr>`)
//   $('#students').append('<%= escape_javascript(render(:partial => @students)) %>')
//   // $('.container').append('<%= escape_javascript(render(:partial => @users)) %>')
// }