class CreateCities < ActiveRecord::Migration[5.0]
  def change
    create_table :cities do |t|
      t.references :country, foreign_key: true
      t.references :state, foreign_key: true
      t.string :name
    end
  end
end
