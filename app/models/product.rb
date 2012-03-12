class Product < ActiveRecord::Base
  #attr_accessible :category_id, :name, :description
  belongs_to :category
  has_many :colors
end
