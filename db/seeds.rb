# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).


DATA = {
  :teacher_keys =>
    ["name", "username", "email", "password_digest"],
  :teachers => [
      ["Peter Tosh", "peter.tosh", "peter.tosh@email.com", BCrypt::Password.create("password")],
      ["Dawn Penn", "dawn.penn", "dawnsings@email.com", BCrypt::Password.create("password")],
      ["Mark Anderson", "mark.anderson", "markstrings@email.com", BCrypt::Password.create("password")]
    ],
  :student_keys =>
    ["name", "email"],
  :students => [
      ["Jamar McNaughton", "dondada876@email.com"],
      ["Sean Roberts", "stringsongs@email.com"],
      ["Solana Rowe", "beanbabe@email.com"],
      ["Kehlani Parrish", "sexysavage@email.com"],
      ["Romario Bennett", "foundationlyrics@email.com"],
      ["Grace Hamilton", "therealspice@email.com"],
      ["Lila Ike", "likklemighty@email.com"],
      ["Andrew Hozier-Byrne", "chxrch1@email.com"],
      ["Hayley Williams", "younggunner@email.com"],
      ["Janelle Monae", "wondabox@email.com"],
      ["Lecrae Moore", "116reach@email.com"],
      ["Tori Kelly", "saltandlight@email.com"],
      ["Wasulu Jaco", "thegreatestfiasco@email.com"],
      ["Lonnie Lynn", "mvmtofsound@email.com"],
      ["India Arie", "lightwalker@email.com"]
    ],
  :events_keys => 
    ["name", "time", "venue"],
  :events => [
      ["Annual Flower Show", DateTime.strptime("04/02/2018 8:00", "%m/%d/%Y %H:%M"), "Independence Park, Black River"],  
      ["Run Come Giddy Up", DateTime.strptime("01/12/2019 18:00", "%m/%d/%Y %H:%M"), "Ranny Williams Entertainment Centre, Kingston"],
      ["DJ Archie's Old Skool Night", DateTime.strptime("03/22/2018 18:00", "%m/%d/%Y %H:%M"), "The Deck, Kingston"],
      ["Shaggy and Friends Concert", DateTime.strptime("06/12/2019 20:00", "%m/%d/%Y %H:%M"), "Lawns of Jamaica House, Kingston"],
      ["An Evening of Classics", DateTime.strptime("11/14/2018 18:00", "%m/%d/%Y %H:%M"), "Montego Bay Convention Centre"],
      ["The Hampton Chorale Silent Night", DateTime.strptime("12/19/2019 12:00", "%m/%d/%Y %H:%M"), "The Great Hall, Santa Cruz"]
    ],
  :rehearsal_keys =>
    ["time", "venue"],
  :rehearsals => [
      [DateTime.strptime("03/30/2018 8:00", "%m/%d/%Y %H:%M"), "Independence Park, Black River"],  
      [DateTime.strptime("01/10/2019 18:00", "%m/%d/%Y %H:%M"), "Ranny Williams Entertainment Centre, Kingston"],
      [DateTime.strptime("03/20/2018 18:00", "%m/%d/%Y %H:%M"), "The Deck, Kingston"],
      [DateTime.strptime("06/10/2019 20:00", "%m/%d/%Y %H:%M"), "Lawns of Jamaica House, Kingston"],
      [DateTime.strptime("11/12/2018 18:00", "%m/%d/%Y %H:%M"), "Montego Bay Convention Centre"],
      [DateTime.strptime("12/17/2019 12:00", "%m/%d/%Y %H:%M"), "The Great Hall, Santa Cruz"]
    ],
    
  # :entry_keys =>
  #   ["title", "content"],
  :entry => {
      :title => "Nemo enim ipsam voluptatem", 
      :content => "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Laboris nisi ut aliquip ex ea commodo consequat. Eaque ipsa quae ab illo inventore veritatis et quasi.

Itaque earum rerum hic tenetur a sapiente delectus. Ut enim ad minim veniam, quis nostrud exercitation ullamco. Excepteur sint occaecat cupidatat non proident, sunt in culpa. Corrupti quos dolores et quas molestias excepturi sint occaecati.

Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit.

Lorem ipsum dolor sit amet, consectetur adipisicing elit. Cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat.

Itaque earum rerum hic tenetur a sapiente delectus. Ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat. Cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia.

    Lorem ipsum dolor sit amet, consectetur adipisicing elit.
    Laboris nisi ut aliquip ex ea commodo consequat.
    Et harum quidem rerum facilis est et expedita distinctio."
    }
}



def main
  puts "Populating database..."
  create_teachers_students_and_entry
  create_events_and_rehearsals
  puts "Done."
end

def create_teachers_students_and_entry
  x = DATA[:students].size
  y = DATA[:teachers].size
  z = x / y
  
  next_student = 0
  
  DATA[:teachers].each do |teacher|
    
    # Create a teacher
    new_teacher = Teacher.new
    teacher.each.with_index do |value, key|
      new_teacher.send(DATA[:teacher_keys][key]+"=", value)
    end
    new_teacher.save
    puts "#{new_teacher.name} has been added."
    
    # Divide the students evenly amongst the teachers
    until new_teacher.students.count == z do
     
      # Create a student
      new_student = new_teacher.students.build
      DATA[:students][next_student].each.with_index do |value, key|
        new_student.send(DATA[:student_keys][key]+"=", value)
      end
      new_student.save
      
      # Give each new student an entry
      new_student.entries.create(DATA[:entry])
      puts "#{new_student.name} is a student of #{new_teacher.name}."
      
      # Increment next_student so that no student has more than one teacher
      next_student += 1

    end
  end
end


def create_events_and_rehearsals
  x = DATA[:events].size
  y = DATA[:teachers].size
  z = x / y
  
  next_event = 0
  next_rehearsal = 0
  
  Teacher.all.each do |teacher|
    # Divide events evenly amongst the teachers
    until teacher.events.count == z do
      
      # Create an event
      new_event = teacher.events.build
      DATA[:events][next_event].each_with_index do |value, key|
        new_event.send(DATA[:events_keys][key]+"=", value)
      end
      new_event.save
      puts "#{new_event.name} has been added"
      
      # Add a rehearsal for each new event
      new_rehearsal = new_event.rehearsals.build
      DATA[:rehearsals][next_rehearsal].each.with_index do |attribute, i|
        new_rehearsal.send(DATA[:rehearsal_keys][i]+"=", attribute)
      end
      new_rehearsal.save
      puts "Rehearsal for #{new_event.name} has been added"
      
      next_rehearsal += 1
      next_event += 1  
    end
  end
end

main
