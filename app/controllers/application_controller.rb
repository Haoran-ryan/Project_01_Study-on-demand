class ApplicationController < ActionController::Base
    before_action :fetch_student

    private 
    def fetch_student 
        @current_student = Student.find_by :id => session[:student_id] if session[:student_id].present? 
        session[:student_id] = nil unless @current_student.present? 
    end 
end
