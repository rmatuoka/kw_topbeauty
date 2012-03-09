class Contact < ActiveRecord::Base
	has_attached_file :curriculum, 
	:url => "/uploads/:attachment/:id/:basename_:style.:extension",
	:path => ":rails_root/public/uploads/:attachment/:id/:basename_:style.:extension"

end
