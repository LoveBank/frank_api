require 'rails_helper'

RSpec.describe Insight, type: :model do
  subject { FactoryGirl.create(:insight) }

  it 'has a valid factory' do
    expect(subject).to be_valid
  end

  it 'persists' do
    expect(subject).to be_persisted
  end

end