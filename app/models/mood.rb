class Mood < ActiveRecord::Base
  belongs_to :profile
  validates :rating, presence: true
end
