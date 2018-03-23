class Teacher < ApplicationRecord
    has_many :students
    has_many :entries, through: :students
    has_many :events
    has_many :rehearsals, through: :events
    
    has_secure_password
    validates :name, :username, :email, presence: true
    validates :email, :email_format => { :message => 'does not look like a valid email address' }
end
