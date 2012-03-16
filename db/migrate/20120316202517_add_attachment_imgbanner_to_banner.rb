class AddAttachmentImgbannerToBanner < ActiveRecord::Migration
  def self.up
    add_column :banners, :imgbanner_file_name, :string
    add_column :banners, :imgbanner_content_type, :string
    add_column :banners, :imgbanner_file_size, :integer
    add_column :banners, :imgbanner_updated_at, :datetime
  end

  def self.down
    remove_column :banners, :imgbanner_file_name
    remove_column :banners, :imgbanner_content_type
    remove_column :banners, :imgbanner_file_size
    remove_column :banners, :imgbanner_updated_at
  end
end
