class SessionController < ApplicationController
    def new 
    end 

    def create 
        student = Student.find_by :email => params[:email]
        if student.present? && student.authenticate(params[:password])
            session[:student_id] = student.id
            redirect_to root_path
        else
            flash[:error] = "Invalid Email or Password."
            redirect_to login_path
        end 
    end 

    def destroy
        session[:student_id] = nil
        redirect_to login_path
    end 
end
