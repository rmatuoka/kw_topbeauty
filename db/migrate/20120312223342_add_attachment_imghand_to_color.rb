class AddAttachmentImghandToColor < ActiveRecord::Migration
  def self.up
    add_column :colors, :imghand_file_name, :string
    add_column :colors, :imghand_content_type, :string
    add_column :colors, :imghand_file_size, :integer
    add_column :colors, :imghand_updated_at, :datetime
  end

  def self.down
    remove_column :colors, :imghand_file_name
    remove_column :colors, :imghand_content_type
    remove_column :colors, :imghand_file_size
    remove_column :colors, :imghand_updated_at
  end
end
