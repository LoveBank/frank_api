class Entry < ActiveRecord::Base
  belongs_to :profile
  has_many :comments
  has_one :action

  after_initialize :init

  def init
    self.occurred_on  ||= Time.now
  end
end
