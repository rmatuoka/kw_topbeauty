class AddCidadeEstadoToContact < ActiveRecord::Migration
  def self.up
    add_column :contacts, :city, :string
    add_column :contacts, :state, :string
  end

  def self.down
    remove_column :contacts, :state
    remove_column :contacts, :city
  end
end
