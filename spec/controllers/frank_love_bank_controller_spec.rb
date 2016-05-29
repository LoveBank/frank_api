require 'rails_helper'

RSpec.describe FrankLoveBankController, type: :controller do
  pending "add some examples to (or delete) #{__FILE__}"
  # context 'ROUTES' do
  #   describe 'index' do
  #     it 'is valid' do
  #       expect(:get => '/frank-love-bank').to route_to(
  #                                       :controller => 'frank_love_bank',
  #                                       :action => 'index'
  #                                   )
  #     end
  #   end
  #   describe 'create love bank' do
  #     it 'is valid' do
  #       expect(:post => '/frank-love-bank').to route_to(
  #                                       :controller => 'frank_love_bank',
  #                                       :action => 'create',
  #                                   )
  #     end
  #   end
  # end
  #
  # describe 'requests' do
  #   let(:note) { Faker::Lorem.paragraph }
  #   let(:profile) { FactoryGirl.create(:frank_profile) }
  #
  #   it 'should create love bank entry' do
  #     byebug
  #     @request.headers['Content-Type'] = JSONAPI::MEDIA_TYPE
  #     json = {:'data' => {:type => 'frank_love_banks',
  #                         :relationships => {
  #                             'frank-profile':
  #                                 {:data => {:type => 'frank-profiles', :'id' => profile.id}}
  #                         },
  #                         :attributes => {
  #                             :rating => Faker::Number.between(1, 5),
  #                             :note => note}
  #                         }
  #     }
  #     post :create, json
  #     p response.body
  #     expect(response.status).to eq(201)
  #     expect(Frank::LoveBank.count).to eq(1)
  #     expect(Frank::LoveBank.first.note).to match(note)
  #     expect(Frank::Profile.first.love_banks.count).to eq(1)
  #   end
  # end
end
