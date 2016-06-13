require 'rails_helper'

RSpec.describe ProfilesController, type: :controller do
  let(:firstname) { Faker::Name.first_name }
  let(:lastname) { Faker::Name.last_name }
  let(:email) { Faker::Internet.email }

  context 'ROUTES' do
    describe 'index' do
      it 'is valid' do
        expect(:get => '/profiles').to route_to(
                                          :controller => 'profiles',
                                          :action => 'index'
                                      )
      end
    end
    describe 'view' do
      it 'profile' do
        expect(:get => '/profiles/1').to route_to(
                                           :controller => 'profiles',
                                           :action => 'show',
                                           :id => '1'
                                       )
      end
    end
    describe 'view profile entries' do
      it 'is valid' do
        expect(:get => '/profiles/1/relationships/entries').to route_to(
                                             :controller => 'profiles',
                                             :relationship => 'entries',
                                             :action => 'show_relationship',
                                             :profile_id => '1'
                                         )
      end
    end
  end

  context 'JSON requests' do

    describe 'profiles' do

      it 'create does not require first name' do
        @request.headers['Content-Type'] = 'application/vnd.api+json'
        json = {
            :data => {
                :type => 'profiles',
                attributes: {
                    :email => email
                }
            }
        }
        post :create, json
        expect(response.status).to eq(201)
        expect(Profile.count).to eq(1)
        expect(Profile.first.email).to match(email)
      end

      it 'should be success' do
        @request.headers['Content-Type'] = 'application/vnd.api+json'
        json = {
                :data => {
                    :type => 'profiles',
                    attributes: {
                        :firstname => firstname,
                        :lastname => lastname,
                        :email => email
                    }
                }
        }
        post :create, json
        expect(response.status).to eq(201)
        expect(Profile.count).to eq(1)
        expect(Profile.first.firstname).to match(firstname)
        expect(Profile.first.lastname).to match(lastname)
        expect(Profile.first.email).to match(email)
      end
    end
  end
end
