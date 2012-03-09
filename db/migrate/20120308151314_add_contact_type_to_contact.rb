class AddContactTypeToContact < ActiveRecord::Migration
  def self.up
    add_column :contacts, :contact_type, :integer
  end

  def self.down
    remove_column :contacts, :contact_type
  end
end
