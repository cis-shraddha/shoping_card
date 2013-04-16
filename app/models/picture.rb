class Picture < ActiveRecord::Base
  attr_accessible :imageable_id, :imageable_type, :photo
  belongs_to :imageable, :polymorphic => true

   has_attached_file :photo, :styles => { :small => "150x150>" },  
      :url => "/system/:attachment/:id/:style/:basename.:extension",  
      :path => ":rails_root/public/system/:attachment/:id/:style/:basename.:extension"  
end
