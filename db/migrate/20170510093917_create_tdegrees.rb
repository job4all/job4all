class CreateTdegrees < ActiveRecord::Migration[5.0]
  def change
    create_table :tdegrees do |t|
      t.string :name

    end
  end
end
