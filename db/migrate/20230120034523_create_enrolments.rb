class CreateEnrolments < ActiveRecord::Migration[5.2]
  def change
    create_table :enrolments do |t|
      t.boolean :completion
      t.integer :student_id

      t.timestamps
    end
  end
end
