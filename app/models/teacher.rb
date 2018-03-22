class Teacher < ApplicationRecord
    has_many :students
    has_many :entries, through: :students
    has_many :events
    has_many :rehearsals, through: :events
end
