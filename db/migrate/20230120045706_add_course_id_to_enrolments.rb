class AddCourseIdToEnrolments < ActiveRecord::Migration[5.2]
  def change
    add_column :enrolments, :course_id, :integer
    remove_column :courses, :enrolment_id
  end
end
