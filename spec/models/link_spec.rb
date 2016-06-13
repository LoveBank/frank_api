require 'rails_helper'

RSpec.describe Link, type: :model do
  let(:david) {FactoryGirl.build(:profile)}
  let(:andy) {FactoryGirl.build(:profile)}

  it 'has links' do
    andy.profiles << david
    andy.save!
    expect(andy.profiles.count).to eq 1
    expect(andy.profiles.first.firstname).to eq david.firstname
    expect(david.source_links.first.profile.firstname).to eq andy.firstname
    expect(Link.first.profile.firstname).to eq(andy.firstname)
    expect(Link.first.source_profile.firstname).to eq(david.firstname)
  end
end
