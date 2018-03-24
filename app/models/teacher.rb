class Teacher < ApplicationRecord
    has_many :students
    has_many :entries, through: :students
    has_many :events
    has_many :rehearsals, through: :events
    
    has_secure_password
    validates :name, :username, :email, presence: true
    validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, message: "is not formatted properly" }
end
