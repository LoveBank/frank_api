require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:profile) { FactoryGirl.create(:profile) }
  subject {Post.new(:title => 'Example Title', :body => Faker::Lorem.paragraph)}

  it 'is a valid Post instance' do
    expect(subject).to be_valid
  end

  it 'has a valid title' do
    expect(subject.title).to eql 'Example Title'
  end
end
