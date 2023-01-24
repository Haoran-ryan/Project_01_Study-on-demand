class PagesController < ApplicationController
  def home
    @student = Student.new 
    @lecturer = Lecturer.new 
  end
end
