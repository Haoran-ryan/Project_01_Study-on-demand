class LecturersController < ApplicationController
    def index 
        @lecturers = Lecturer.all
    end
    
    def show
        @lecturer = Lecturer.find(params[:id])
    end 

    def new
        @lecturer = Lecturer.new
    end 

    def create
        @lecturer = Lecturer.new lecturer_params
        if @lecturer.save 
            session[:lecturer_id] = @lecturer.id
            redirect_to @lecturer
        else
            render :new 
        end 
    end 
    
    def edit
        @lecturer = Lecturer.find(params[:id])
        if @lecturer.authenticate(params[:password])
        end 
    end 
    
    def update
        @lecturer = Lecturer.find(params[:id])
        if @lecturer.update lecturer_params
            redirect_to @lecturer
        else 
            render :edit
        end 
    end 

    def destroy
        lecturer = Lecturer.find(params[:id])
        lecturer.destroy
        redirect_to lecturers_path
    end 

    private 
    def lecturer_params
        params.require(:lecturer).permit(:name, :email, :image, :password, :password_confirmation)
    end 

end
