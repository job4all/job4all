class CreateAdvertises < ActiveRecord::Migration[5.0]
  def change
    create_table :advertises do |t|
      t.references :newspaper, foreign_key: true
      t.string :title
      t.string :state
      t.string :description
      t.date :idate
      t.date :lastdate
      t.references :organization, foreign_key: true
      t.references :user, foreign_key: true
    end
  end
end
