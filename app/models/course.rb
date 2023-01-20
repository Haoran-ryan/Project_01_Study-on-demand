class Course < ApplicationRecord
    has_many :enrolments
    has_and_belongs_to_many :lecturers
end
