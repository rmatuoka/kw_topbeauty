class Reseller < ActiveRecord::Base
  attr_accessible :name, :fantasy_name, :address, :number, :neibourhood, :city, :state, :phone, :active
end
