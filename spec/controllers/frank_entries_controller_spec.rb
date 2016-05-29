require 'rails_helper'

RSpec.describe FrankEntriesController, type: :controller do
  let(:note) { Faker::Lorem.paragraph }
  let(:profile) { FactoryGirl.create(:frank_profile) }

  context 'JSON' do
    context 'ROUTES' do
      describe 'index' do
        it 'is valid' do
          expect(:get => '/frank-entries').to route_to(
                                             :controller => 'frank_entries',
                                             :action => 'index'
                                         )
        end
      end

      describe 'create entries' do
        it 'is valid' do
          expect(:post => 'frank-entries').to route_to(
                                             :controller => 'frank_entries',
                                             :action => 'create',
                                         )
        end
      end
    end


    describe 'requests' do

      it 'should create a entry' do
        @request.headers['Content-Type'] = JSONAPI::MEDIA_TYPE
        json =
            { "data":
                  { "type": "frank_entries",
                    "relationships": {
                        "frank-profile":
                            { "data":
                                  { "type": "frank_profiles", "id": profile.id }
                            }
                    },
                    "attributes": {
                        "received": true,
                        "private": false,
                        "note": note,
                        "rating": 1
                    }
                  }
            }
        post :create, json
        expect(response.status).to eq(201)
        expect(Frank::Entry.first.received).to be true
        expect(Frank::Entry.first.note).to match(note)
      end

    end

  end
end
