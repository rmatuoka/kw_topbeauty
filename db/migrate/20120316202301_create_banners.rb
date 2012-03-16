class CreateBanners < ActiveRecord::Migration
  def self.up
    create_table :banners do |t|
      t.text :texto
      t.string :link
      t.timestamps
    end
  end

  def self.down
    drop_table :banners
  end
end
