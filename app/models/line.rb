class Line < ActiveRecord::Base
  has_many :categories
  has_attached_file :imgline,:styles => { :medium => "965x238>", :thumb => "100x100>" }
end
