class Link < ActiveRecord::Base
  belongs_to :profile, :class_name => 'Profile', :foreign_key => 'profile_id'
  belongs_to :source_profile, :class_name => 'Profile', :foreign_key => 'to_profile_id'
end