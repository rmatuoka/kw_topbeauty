class Color < ActiveRecord::Base
  belongs_to :product
  has_attached_file :imgpallete,:styles => { :medium => "200x286>", :thumb => "100x100>" }
  has_attached_file :imgenamel,:styles => { :medium => "200x286>", :thumb => "100x100>" }
  has_attached_file :imghand,:styles => { :medium => "200x286>", :thumb => "100x100>" }
end
