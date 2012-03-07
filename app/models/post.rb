class Post < ActiveRecord::Base
  #attr_accessible :sumary, :description
  #has_attached_file :image,:styles => { :large => "619x168>",:medium => "304x169>", :thumb => "100x100>" }	
  has_attached_file:image,:styles => { :large => "619x168>",:medium => ["304x169>"],:mediumpb => ["304x169>"], :thumb => ["100x100>"] }, :convert_options => { :mediumpb => '-colorspace gray'}
  has_attached_file:imagehead,:styles => {:medium => ["628x119>"], :thumb => ["100x100>"] }
  end
