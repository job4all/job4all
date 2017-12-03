class CreateUserskills < ActiveRecord::Migration[5.0]
  def change
    create_table :userskills do |t|
      t.references :skill, foreign_key: true
      t.references :user, foreign_key: true
      t.string :lastd
    end
  end
end
