class CreateResumes < ActiveRecord::Migration
  def change
    create_table :resumes do |t|
      t.string :username
      t.string :password

      t.timestamps
    end
  end
end
