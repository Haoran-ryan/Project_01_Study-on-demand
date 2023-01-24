class StudentsController < ApplicationController
  def index
    @students = Student.all
  end

  def show
    @student = Student.find(params[:id])
  end

  def new
    @student = Student.new
  end

  def create 
    @student = Student.new student_params
    if @student.save
      session[:student_id] = @student.id
      redirect_to @student
    else 
      render :new
    end 
  end 
 
  def edit
    @student = Student.find(params[:id])
    if @student.authenticate(params[:id])
      # proceed with the edit action 
    # else 
    #   redirect_to root_path, notice:"Invalid password"
    end 
  end

  def update 
    @student = Student.find params[:id]
      if @student.update(student_params) 
        redirect_to @student
      else
        render :edit
      end
    
  end 
  
  def destroy
    student = Student.find(params[:id])
    student.destroy
    redirect_to students_path
  end 

  private 
  def student_params
    params.require(:student).permit(:name, :email, :image, :password, :password_confirmation)
  end 

end 
