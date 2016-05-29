class FrankProfileResource < JSONAPI::Resource
  model_name 'Frank::Profile'
  attributes :firstname, :lastname, :full_name, :email, :created_at, :linked_email
  # key_type :uuid
  after_create :slack_notify

  has_many :frank_entries
  has_many :frank_links
  # has_many :frank_comments
  # has_many :frank_love_banks
  # relationship :frank_family, to: :one

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

  # link the specified profile to this profile
  def linked_email=(new_email)
    @linked_profile = Frank::Profile.find_or_create_by(:email => new_email.downcase)
    @model.profiles << @linked_profile
  end

  def self.fields
    super - [:linked_email]
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
