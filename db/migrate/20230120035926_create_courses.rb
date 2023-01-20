class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.text :name
      t.text :intro
      t.text :image
      t.integer :enrolment_id

      t.timestamps
    end
  end
end
