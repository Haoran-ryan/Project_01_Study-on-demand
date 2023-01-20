class CreateCoursesLecturers < ActiveRecord::Migration[5.2]
  def change
    create_table :courses_lecturers, :id =>false do |t|
      t.integer :course_id
      t.integer :lecturer_id
    end
  end
end
