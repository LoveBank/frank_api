require 'rails_helper'

RSpec.describe EntriesController, type: :controller do
  let(:note) { Faker::Lorem.paragraph }
  let(:profile) { FactoryGirl.create(:frank_profile) }

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


    describe 'requests' do

      it 'should create a entry' do
        @request.headers['Content-Type'] = JSONAPI::MEDIA_TYPE
        json =
            { "data":
                  { "type": "entries",
                    "relationships": {
                        "profile":
                            { "data":
                                  { "type": "profiles", "id": profile.id }
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
