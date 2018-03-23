class Student < ApplicationRecord
  belongs_to :teacher
  has_many :entries
  has_many :attendances
  has_many :rehearsals, through: :attendances
  
  validates :name, :email, presence: true
  validates :email, :email_format => { :message => 'does not look like a valid email address' }
end
