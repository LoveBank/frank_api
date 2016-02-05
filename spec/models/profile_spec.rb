require 'rails_helper'

describe Profile, type: :model do
  it 'has a valid factory' do
    expect(FactoryGirl.create(:profile)).to be_valid
  end

  it 'is invalid without a firstname' do
    expect(FactoryGirl.build(:profile, firstname: nil)).to_not be_valid
  end

  it 'is invalid without a lastname' do
    expect(FactoryGirl.build(:profile, lastname: nil)).to_not be_valid
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

end
