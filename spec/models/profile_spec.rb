require 'rails_helper'

RSpec.describe Profile, type: :model do
  it 'has a valid factory' do
    expect(FactoryGirl.create(:profile)).to be_valid
  end

  it 'is invalid with duplicate email case insensitive check' do
    FactoryGirl.create(:profile, email: 'jared@jaredjennings.org')
    expect(FactoryGirl.build(:profile, email: 'jared@jaredjennings.org')).to_not be_valid
  end

  it 'is invalid with duplicate email' do
    FactoryGirl.create(:profile, email: 'jared@jaredjennings.org')
    expect(FactoryGirl.build(:profile, email: 'JareD@jaredjennings.org')).to_not be_valid
  end

  it 'contains a phone number' do
    expect(FactoryGirl.build(:profile).phone).to_not be_nil
  end

  context 'partners_entries' do
    let(:user) { FactoryGirl.build_stubbed(:profile) }

    it 'partner has entries' do
      FactoryGirl.create_list(:entry, 2, :linked_profile_id => user.id, :private => false, :received => true)
      expect(user.partners_entries.count).to eql 2
    end

    it 'does not show private entries' do
      FactoryGirl.create_list(:entry, 2, :linked_profile_id => user.id, :private => true, :received => true)
      expect(user.partners_entries.count).to eql 0
    end

    it 'partner has entries sync last report' do
      FactoryGirl.create_list(:entry, 2, :linked_profile_id => user.id, :private => false, :received => true)
      user.last_daily_report_id = Entry.first.id
      expect(user.partners_entries.count).to eql 1
    end
  end
end
