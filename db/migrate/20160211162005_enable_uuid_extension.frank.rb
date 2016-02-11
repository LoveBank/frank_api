# This migration comes from frank (originally 20151107181045)
class EnableUuidExtension < ActiveRecord::Migration
  def self.up
    enable_extension 'uuid-ossp'
  end

  def self.down
    disable_extension 'uuid-ossp'
  end
end
