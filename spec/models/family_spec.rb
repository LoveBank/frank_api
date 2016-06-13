require 'rails_helper'

RSpec.describe Family, type: :model do
  it 'has a valid factory' do
    expect(FactoryGirl.create(:family)).to be_valid
  end

  it 'is invalid without a name' do
    expect(FactoryGirl.build(:family, name: nil)).to_not be_valid
  end
end