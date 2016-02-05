module Encryption
  extend ActiveSupport::Concern

  module ClassMethods
    def encryption_key
      # if in production. require key to be set.
      if Rails.env.production?
        raise 'Must set token key!!' unless ENV['ENC_EMAIL_KEY']
        ENV['ENC_EMAIL_KEY']
      else
        ENV['ENC_EMAIL_KEY'] ? ENV['ENC_EMAIL_KEY'] : 'test_key'
      end
    end
  end

end
