class CreateLecturers < ActiveRecord::Migration[5.2]
  def change
    create_table :lecturers do |t|
      t.text :name
      t.text :email
      t.text :image
      t.boolean :admin

      t.timestamps
    end
  end
end
