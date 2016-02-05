require 'rails_helper'

RSpec.describe LoveBank, type: :model do
  it 'has a valid factory' do
    expect(FactoryGirl.create(:love_bank)).to be_valid
  end

  it 'contains a note' do
    expect(FactoryGirl.build(:love_bank).note).to_not be_nil
  end
end
