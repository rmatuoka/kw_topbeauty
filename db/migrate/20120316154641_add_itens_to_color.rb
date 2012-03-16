class AddItensToColor < ActiveRecord::Migration
  def self.up
    add_column :colors, :modern, :decimal, :default => 0
    add_column :colors, :modern_total, :int, :default => 0

    add_column :colors, :conservative, :decimal, :default => 0
    add_column :colors, :conservative_total, :int, :default => 0

    add_column :colors, :sexy, :decimal, :default => 0
    add_column :colors, :sexy_total, :int, :default => 0

    add_column :colors, :day, :decimal, :default => 0
    add_column :colors, :day_total, :int, :default => 0

    add_column :colors, :night, :decimal, :default => 0
    add_column :colors, :night_total, :int, :default => 0
  end

  def self.down
    remove_column :colors, :modern_total
    remove_column :colors, :modern

    remove_column :colors, :conservative_total
    remove_column :colors, :conservative

    remove_column :colors, :sexy_total
    remove_column :colors, :sexy

    remove_column :colors, :day_total
    remove_column :colors, :day

    remove_column :colors, :night_total
    remove_column :colors, :night
  end
end
