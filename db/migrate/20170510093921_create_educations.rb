class CreateEducations < ActiveRecord::Migration[5.0]
  def change
    create_table :educations do |t|
      t.references :tdegree, foreign_key: true
      t.references :degree, foreign_key: true
      t.string :subject
      t.references :city, foreign_key: true
      t.references :institute, foreign_key: true
      t.integer :tmarks
      t.integer :omarks
      t.integer :persent
      t.string :division
      t.date :passyear
      t.references :user, foreign_key: true

    end
  end
end
