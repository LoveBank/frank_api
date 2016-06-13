require 'rails_helper'

RSpec.describe Comment, type: :model do
  context 'valid comment objects' do
    subject { FactoryGirl.create(:comment) }

    it 'has a valid factory' do
      expect(subject).to be_valid
    end

    it 'persists' do
      expect(subject).to be_persisted
    end

  end
end