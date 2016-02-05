class Profile < ActiveRecord::Base
  # include Encryption
  has_many :entries
  has_many :comments
  has_many :moods
  has_many :love_banks
  belongs_to :family

  ### Validations
  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }

  ### Encryption
  # attr_encrypted :email, key: encryption_key, :encode => true
  # attr_encrypted :phone, key: encryption_key, :encode => true

  ### stores the email to uppercase so that searches for the encrypted value are case insensitive
  # def email=(value)
  #   write_attribute(:encrypted_email, value.downcase)
  # end

end
