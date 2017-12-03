class CreateInstitutes < ActiveRecord::Migration[5.0]
  def change
    create_table :institutes do |t|
      t.references :city, foreign_key: true
      t.string :name
    end
  end
end
