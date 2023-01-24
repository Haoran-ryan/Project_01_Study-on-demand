class ApplicationController < ActionController::Base
    before_action :fetch_student
    before_action :fetch_lecturer
    

    private 
    def fetch_student 
        @current_student = Student.find_by :id => session[:student_id] if session[:student_id].present? 
        session[:student_id] = nil unless @current_student.present? 
    end 

    def fetch_lecturer
        @current_lecturer = Lecturer.find_by :id => session[:lecturer_id] if session[:lecturer_id].present? 
        session[:lecturer_id] = nil unless @current_lecturer.present? 
    end 

    # def check_for_admin
    #     redirect_to login_path unless (@current_student.present? || (@current_lecturer.present? && current_lecturer.admin?))
    # end 
end
