require 'rails_helper'

module Frank
  RSpec.describe InsightsController, type: :controller do
    let(:profile) { FactoryGirl.create(:frank_profile) }

    context 'JSON' do
      context 'ROUTES' do
        describe 'index' do
          it 'is valid' do
            expect(:get => 'insights').to route_to(
                                                  :controller => 'insights',
                                                  :action => 'index'
                                              )
          end
        end
      end


      describe 'requests' do
        it 'should create a insight' do
          @request.headers['Content-Type'] = JSONAPI::MEDIA_TYPE
          json =
              { "data":
                    { "type": "insights",
                      "attributes": {
                          "title": "Example Title 1",
                          "body": Faker::Lorem.paragraph
                      }
                    }
              }
          post :create, json
          expect(response.status).to eq(201)
          expect(Frank::Insight.first.body).to_not be nil
        end

      end

    end
  end
end

