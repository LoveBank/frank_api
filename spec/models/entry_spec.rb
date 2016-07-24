require 'rails_helper'

RSpec.describe Entry, type: :model do
  context 'entry' do
    subject { FactoryGirl.create(:entry, :note => 'My awesome comment') }

    it 'has a valid factory' do
      expect(subject).to be_valid
    end

    it 'persists' do
      expect(subject).to be_persisted
    end

    context 'notes' do
      it 'is found by profile_id' do
        n = subject ## there has to be a better way of doing this. The lazy creation of subject causes problems
        expect(Entry.find_by_note('My awesome comment').note).to eq(n.note)
      end

      it { expect(subject).to have_attributes(:note => be_a(String) ) }
    end

    context 'rates' do
      it 'more than 0' do
        expect(subject.rating).to be > 0
      end

      it 'less than 6' do
        expect(subject.rating).to be < 6
      end
    end

    context 'dates' do
      let(:occurred) { Time.zone.now.yesterday }
      subject { FactoryGirl.create(:entry, :occurred_on => occurred) }

      it 'occurred yesterday' do
        expect(subject.occurred_on.to_i).to be == occurred.to_i
      end

      it 'sets occurred if no value set' do
        expect(subject.occurred_on.to_i).to be > 0
      end

    end

  end
end