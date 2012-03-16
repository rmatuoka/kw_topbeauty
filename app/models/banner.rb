class Banner < ActiveRecord::Base
  has_attached_file :imgbanner,:styles => { :medium => "223x248>", :thumb => "100x100>" }
end
