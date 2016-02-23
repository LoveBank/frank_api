class ProfileResource < JSONAPI::Resource
  model_name 'Frank::Profile'
  attributes :firstname, :lastname, :full_name, :email
  # key_type :uuid
  after_create :slack_notify

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


  private
  def slack_notify

    if Rails.env.production?
      notifier = Slack::Notifier.new ENV['SLACK_HOOK_URL_REGISTRATIONS']
      notifier.channel = '#registrations'
      notifier.ping "New registration #{@model.email}"
    else
      Rails.logger.debug "Simulating Slack ping because we are in development mode - 'New registration #{@model.email}'"
    end
  end

end
