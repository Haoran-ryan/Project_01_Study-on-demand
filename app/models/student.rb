class Student < ApplicationRecord
    has_many :enrolments
    has_secure_password
    validates :email, :uniqueness => true, :presence => true
    
    
      
      
end
