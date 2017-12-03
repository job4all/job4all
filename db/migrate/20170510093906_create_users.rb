class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :mobile
      t.string :fname
      t.date :dob
      t.string :cnic
      t.string :gender
      t.references :state, foreign_key: true
      t.references :city, foreign_key: true
      t.text :address
      t.text :skills
      t.string :resume

    end
  end
end
