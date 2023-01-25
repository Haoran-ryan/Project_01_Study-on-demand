class AddLecturerIdToEnrolments < ActiveRecord::Migration[5.2]
  def change
    add_column :enrolments, :lecturer_id, :integer
  end
end
