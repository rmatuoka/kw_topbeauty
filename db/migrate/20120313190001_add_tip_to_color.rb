class AddTipToColor < ActiveRecord::Migration
  def self.up
    add_column :colors, :tip, :text
  end

  def self.down
    remove_column :colors, :tip
  end
end
