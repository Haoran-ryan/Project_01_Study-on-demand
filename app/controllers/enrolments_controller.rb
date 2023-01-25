class EnrolmentsController < ApplicationController
    def index
        @enrolments = Enrolment.all
    end 

    def create 
        enrolment = Enrolment.create enrolment_params 
        @current_student.enrolments << enrolment
        redirect_to @current_student
    end 

    def destroy
        enrolment = Enrolment.find(params[:id])
        enrolment.destroy
        redirect_back(fallback_location: root_path)
    end 
    
    private 
    def enrolment_params
        params.require(:enrolment).permit(:course_id, :lecturer_id)
    end 
end
