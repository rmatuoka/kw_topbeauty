class Post < ActiveRecord::Base
  #attr_accessible :sumary, :description
  has_attached_file :image,:styles => { :large => "619x168>",:medium => "298x168>", :thumb => "100x100>" }	
end
