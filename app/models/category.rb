class Category < ActiveRecord::Base
  #attr_accessible :name, :description
  has_attached_file :highlights,:styles => { :medium => "300x300>", :thumb => "100x100>" }
  has_many :products	
end
