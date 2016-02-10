require 'rails_helper'

RSpec.describe LoveBankController, type: :controller do
  context 'ROUTES' do
    describe 'index' do
      it 'is valid' do
        expect(:get => '/love-bank').to route_to(
                                        :controller => 'love_bank',
                                        :action => 'index'
                                    )
      end
    end
    describe 'create mood' do
      it 'is valid' do
        expect(:post => '/love-bank').to route_to(
                                        :controller => 'love_bank',
                                        :action => 'create',
                                    )
      end
    end
  end

  describe 'requests' do
    let(:note) { Faker::Lorem.paragraph }
    let(:profile) { FactoryGirl.create(:frank_profile) }

    it 'should create love bank entry' do
      @request.headers['Content-Type'] = JSONAPI::MEDIA_TYPE
      json = {:'data' => {:type => 'love_banks',
                          :relationships => {
                              profile:
                                  {:data => {:type => 'profiles', :'id' => profile.id}}
                          },
                          :attributes => {
                              :rating => Faker::Number.between(1, 5),
                              :note => note}
      }
      }
      post :create, json
      expect(response.status).to eq(201)
      expect(Frank::LoveBank.count).to eq(1)
      expect(Frank::LoveBank.first.note).to match(note)
      expect(Frank::Profile.first.love_banks.count).to eq(1)
    end
  end
end
