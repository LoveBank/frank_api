require 'rails_helper'

RSpec.describe EntriesController, type: :controller do
  context 'JSON' do
    context 'ROUTES' do
      describe 'index' do
        it 'is valid' do
          expect(:get => '/entries').to route_to(
                                             :controller => 'entries',
                                             :action => 'index'
                                         )
        end
      end

      describe 'create entries' do
        it 'is valid' do
          expect(:post => 'entries').to route_to(
                                             :controller => 'entries',
                                             :action => 'create',
                                         )
        end
      end
    end
  end

  context 'post' do
    describe 'requests' do
      let(:profile) { FactoryGirl.create(:profile) }
      let(:paragraph) { Faker::Lorem.paragraph }

      it 'should create a entry' do
        @request.headers['Content-Type'] = JSONAPI::MEDIA_TYPE
        json =
            { "data":
                  { "type": 'entries',
                    "relationships": {
                        "profile":
                            { "data":
                                  { "type": 'profiles', 'id': profile.id }
                            }
                    },
                    "attributes": {
                        "received": true,
                        "private": false,
                        "note": paragraph,
                        "rating": 3
                    }
                  }
            }
        post :create, json
        expect(response.status).to eq(201)
        expect(Entry.first.received).to be true
        expect(Entry.first.note).to match(paragraph)
      end

    end
  end
end
