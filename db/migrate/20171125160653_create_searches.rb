class CreateSearches < ActiveRecord::Migration[5.0]
  def change
    create_table :searches do |t|
      t.string :keywords
      t.references :profession, foreign_key: true
      t.references :degree, foreign_key: true
      t.references :city, foreign_key: true
      t.references :advertise, foreign_key: true

      t.timestamps
    end
  end
end
