# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
  - Project generated with `rails new`
- [x] Include at least one has_many relationship (x has_many y e.g. User has_many Recipes)
  - User has_many Students, User model line 16
- [x] Include at least one belongs_to relationship (x belongs_to y e.g. Post belongs_to User)
  - Student belongs_to User, Student model line 2
- [x] Include at least one has_many through relationship (x has_many y through z e.g. Recipe has_many Items through Ingredients)
  - Student has_many Rehearsals through Attendances
- [x] The "through" part of the has_many through includes at least one user submittable attribute (attribute_name e.g. ingredients.quantity)
  - `attendance.going` is updated by the User via ../views/rehearsals/show.html.erb
- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
  - The following models have validations: User, Student, Entry, Event, and Rehearsal
- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
  - Attendance.going URL: /rehearsals/1  Update this value by clicking 'Yes' in the 'Attending' column then click on the corresponding student's name to see the Rehearsal show up on their page in the 'Rehearsals' tab
- [x] Include signup (how e.g. Devise)
  - Devise
- [x] Include login (how e.g. Devise)
  - Devise
- [x] Include logout (how e.g. Devise)
  - Devise
- [x] Include third party signup/login (how e.g. Devise/OmniAuth)
  - Devise
- [x] Include nested resource show or index (URL e.g. users/2/recipes)
  - students/1/entries/1
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients)
  - students/1/entries/new
- [x] Include form display of validation errors (form URL e.g. /recipes/new)
  - /students/new

Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate
