class Student < ApplicationRecord
    has_many :enrolments
    has_secure_password
    validates :password, presence: true

end
