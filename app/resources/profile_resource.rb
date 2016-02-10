class ProfileResource < JSONAPI::Resource
  model_name 'Frank::Profile'
  attributes :firstname, :lastname, :full_name, :email
  # key_type :uuid

  has_many :entries
  has_many :comments
  has_many :love_banks
  relationship :family, to: :one

  filter :email, apply: ->(records, value, options) {
    if value.is_a?(Array)
      value.each do |val|
        records = records.where('lower(email) = ?', val.downcase)
      end
      records
    else
      records.where('lower(email) = ?', value.downcase)
    end
  }

  def full_name
    "#{@model.firstname} #{@model.lastname}"
  end

end
