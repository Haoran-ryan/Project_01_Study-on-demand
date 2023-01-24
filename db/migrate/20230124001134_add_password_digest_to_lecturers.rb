class AddPasswordDigestToLecturers < ActiveRecord::Migration[5.2]
  def change
    add_column :lecturers, :password_digest, :string
  end
end
