require 'rails_helper'

RSpec.describe Mood, type: :model do
  it 'has a valid factory' do
    expect(FactoryGirl.create(:mood)).to be_valid
  end

  it 'contains a note' do
    expect(FactoryGirl.build(:mood).note).to_not be_nil
  end

  it 'requires a rating' do
    expect(FactoryGirl.build(:mood, :rating => nil).valid?).to be false
  end

end
