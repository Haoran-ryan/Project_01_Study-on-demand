class Enrolment < ApplicationRecord
    belongs_to :student, :optional => true 
    belongs_to :course, :optional => true 
    belongs_to :lecturer, :optional => true 

end
