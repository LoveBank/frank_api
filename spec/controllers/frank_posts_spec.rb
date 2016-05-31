require 'rails_helper'

module Frank
  RSpec.describe PostsController, type: :controller do
    let(:profile) { FactoryGirl.create(:frank_profile) }

    context 'JSON' do
      context 'ROUTES' do
        describe 'index' do
          it 'is valid' do
            expect(:get => 'posts').to route_to(
                                                  :controller => 'posts',
                                                  :action => 'index'
                                              )
          end
        end

        describe 'create posts' do
          it 'is valid' do
            expect(:post => 'posts').to route_to(
                                                    :controller => 'posts',
                                                    :action => 'create',
                                                )
          end
        end
      end


      describe 'requests' do

        it 'should create a post' do
          @request.headers['Content-Type'] = JSONAPI::MEDIA_TYPE
          json =
              { "data":
                    { "type": "posts",
                      "relationships": {
                          "frank-profile":
                              { "data":
                                    { "type": "frank-profiles", "id": profile.id }
                              }
                      },
                      "attributes": {
                          "title": "Example Title 1",
                          "body": Faker::Lorem.paragraph
                      }
                    }
              }
          post :create, json
          p response.body
          expect(response.status).to eq(201)
          expect(Frank::Post.first.body).to_not be nil
        end

      end

    end
  end
end
