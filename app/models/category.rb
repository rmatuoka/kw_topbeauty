class Category < ActiveRecord::Base
  #attr_accessible :name, :description
  has_attached_file :highlights,:styles => { :medium => "965x238>", :thumb => "100x100>" }
  
  belongs_to :line
  has_many :products	
end
