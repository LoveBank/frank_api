require 'rails_helper'

RSpec.describe FrankMoodsController, type: :controller do

  pending "add some examples to (or delete) #{__FILE__}"
  #
  # context 'ROUTES' do
  #   describe 'index' do
  #     it 'is valid' do
  #       expect(:get => '/frank-moods').to route_to(
  #                                          :controller => 'frank_moods',
  #                                          :action => 'index'
  #                                      )
  #     end
  #   end
  #   describe 'create mood' do
  #     it 'is valid' do
  #       expect(:post => 'frank-moods').to route_to(
  #                                         :controller => 'frank_moods',
  #                                         :action => 'create',
  #                                     )
  #     end
  #   end
  # end
  #
  # describe 'requests' do
  #   let(:note) { Faker::Lorem.paragraph }
  #   let(:profile) { FactoryGirl.create(:frank_profile) }
  #
  #   it 'should create a mood' do
  #     @request.headers['Content-Type'] = JSONAPI::MEDIA_TYPE
  #     json = {:'data' => {:type => 'moods',
  #                         :relationships => {
  #                             profile:
  #                                 {:data => {:type => 'profiles', :'id' => profile.id}}
  #                         },
  #                         :attributes => {
  #                             :rating => Faker::Number.between(1, 5),
  #                             :note => note}
  #     }
  #     }
  #     post :create, json
  #     expect(response.status).to eq(201)
  #     expect(Frank::Mood.count).to eq(1)
  #     expect(Frank::Mood.first.note).to match(note)
  #     expect(Frank::Profile.first.moods.count).to eq(1)
  #   end
  # end
end