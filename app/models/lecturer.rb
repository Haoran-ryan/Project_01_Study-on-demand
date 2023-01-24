class Lecturer < ApplicationRecord
    has_and_belongs_to_many :courses
    has_secure_password
    validates :email, :uniqueness => true, :presence => true
end
