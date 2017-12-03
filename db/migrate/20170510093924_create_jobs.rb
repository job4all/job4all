class CreateJobs < ActiveRecord::Migration[5.0]
  def change
    create_table :jobs do |t|
      t.references :advertise, foreign_key: true
      t.references :profession, foreign_key: true
      t.integer :qty
      t.references :degree, foreign_key: true
      t.references :city, foreign_key: true
    end
  end
end
