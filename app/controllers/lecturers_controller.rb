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
        lecturer = Lecturer.create lecturer_params
        redirect_to lecturer
    end 
    
    def edit
        @lecturer = Lecturer.find(params[:id])
    end 
    
    def update
        lecturer = Lecturer.find(params[:id])
        lecturer.update lecturer_params
        redirect_to lecturer
    end 

    def destroy
        lecturer = Lecturer.find(params[:id])
        lecturer.destroy
        redirect_to lecturers_path
    end 
    private 
    def lecturer_params
        params.require(:lecturer).permit(:name, :email, :image)
    end 

end
