require "rails_helper"

RSpec.describe InvitePartner, type: :mailer do
  describe 'invite' do
    let(:user) { FactoryGirl.build_stubbed(:profile) }
    let(:partner_email) { Faker::Internet.email }
    let(:mail) { InvitePartner.invite_partner(user, partner_email) }

    before(:each) do
      ActionMailer::Base.deliveries = []
    end

    after(:each) do
      ActionMailer::Base.deliveries.clear
    end

    it 'should send an email' do
      mail.deliver_now
      expect(ActionMailer::Base.deliveries.count).to eql 1
    end

    it 'renders the subject' do
      expect(mail.subject).to eql("#{user.firstname} would like to invite you to join Love Bank")
    end

    it 'renders the receiver email' do
      expect(mail.to).to eql([partner_email])
    end

    it 'renders the sender email' do
      expect(mail.from).to eql(['report@treasury.love'])
    end

    it 'assigns @name' do
      expect(mail.body.encoded).to match(user.firstname)
    end

    it 'assigns @confirmation_url' do
      expect(mail.body.encoded).to match("<h1>Hi, #{user.firstname} would like to invite you to join Love bank.</h1>")
    end
  end
end
