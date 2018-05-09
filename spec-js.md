# Specifications for the Rails with jQuery Assessment

Specs:
- [x] Use jQuery for implementing new requirements
  - configured Rails server to load controller-specific scripts on the appropriate pages
- [x] Include a show resource rendered using jQuery and an Active Model Serialization JSON backend.
  - When the entries#show view is loaded, entries.js loads all the entry ids for the current student into an array called allIds, and a click event listener is attached to the 'View Next' button (line 15, entries.js). When that click event occurs, the current entry data on the page is replaced with the data retrieved for the next entry (line 33, entries.js).
- [x] Include an index resource rendered using jQuery and an Active Model Serialization JSON backend.
  - When the students#index view is loaded, a click event listener is attached to the 'Load More' button (line 6, students.js). When that click event occurs, student data is retrieved in json format from the students#more endpoint (line 8, students_controller.rb) and added to the students list (line 38, students.js).
- [ ] Include at least one has_many relationship in information rendered via JSON and appended to the DOM.
  - When the events#show view is loaded, a click event listener is attached to the 'Load Rehearsals' link (line 2, events.js). The 'Load Rehearsals' link href is set to /events/:id/rehearsals. When the click event occurs, a get request will be sent to the rehearsals#index endpoint and all the data for all rehearsals associated with the current event are returned in json format (line 15, rehearsals_controller.rb). For each rehearsal returned, a new rehearsal row is added below the link (line 16, events.js). 
- [x] Use your Rails API and a form to create a resource and render the response without a page refresh.
  - When the students#new view is loaded, a submit event listener is attached to the new_student form (line 15, students.js). When that submit event occurs, the form data is posted to /students and students#create returns the students#show html for that student (line 31, students_controller.rb). That html is added to page without triggering a page refresh.
- [x] Translate JSON responses into js model objects.
  - Student object, line 35 students.js
- [x] At least one of the js model objects must have at least one method added by your code to the prototype.
  - Student.prototype.renderStudentRow, line 73 students.js

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message
