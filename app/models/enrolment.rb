class Enrolment < ApplicationRecord
    belongs_to :students, :optional => true 
    belongs_to :course, :optional => true 

end
