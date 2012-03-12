class AddLineIdToCategory < ActiveRecord::Migration
  def self.up
    add_column :categories, :line_id, :integer
  end

  def self.down
    remove_column :categories, :line_id
  end
end
