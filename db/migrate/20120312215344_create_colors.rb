class CreateColors < ActiveRecord::Migration
  def self.up
    create_table :colors do |t|
      t.integer :product_id
      t.string :name
      t.text :description
      t.timestamps
    end
  end

  def self.down
    drop_table :colors
  end
end
