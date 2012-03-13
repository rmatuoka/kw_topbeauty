class AddAttachmentImgenamelToColor < ActiveRecord::Migration
  def self.up
    add_column :colors, :imgenamel_file_name, :string
    add_column :colors, :imgenamel_content_type, :string
    add_column :colors, :imgenamel_file_size, :integer
    add_column :colors, :imgenamel_updated_at, :datetime
  end

  def self.down
    remove_column :colors, :imgenamel_file_name
    remove_column :colors, :imgenamel_content_type
    remove_column :colors, :imgenamel_file_size
    remove_column :colors, :imgenamel_updated_at
  end
end
