class CreateExperiences < ActiveRecord::Migration[5.0]
  def change
    create_table :experiences do |t|
      t.string :designation
      t.references :profession, foreign_key: true
      t.references :city, foreign_key: true
      t.references :organization, foreign_key: true
      t.date :start_date
      t.date :end_date
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
