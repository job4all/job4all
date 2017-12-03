class AddImageToAdvertises < ActiveRecord::Migration[5.0]
  def self.up
    change_table :advertises do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :advertises, :image
  end

end
