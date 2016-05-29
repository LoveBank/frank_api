require 'rails_helper'

RSpec.describe FrankProfilesController, type: :controller do
  let(:firstname) { Faker::Name.first_name }
  let(:lastname) { Faker::Name.last_name }
  let(:email) { Faker::Internet.email }

  context 'ROUTES' do
    describe 'index' do
      it 'is valid' do
        expect(:get => '/frank-profiles').to route_to(
                                          :controller => 'frank_profiles',
                                          :action => 'index'
                                      )
      end
    end
    describe 'view' do
      it 'frank-profile' do
        expect(:get => '/frank-profiles/1').to route_to(
                                           :controller => 'frank_profiles',
                                           :action => 'show',
                                           :id => '1'
                                       )
      end
    end
    describe 'view frank-profile entries' do
      it 'is valid' do
        expect(:get => '/frank-profiles/1/relationships/frank-entries').to route_to(
                                             :controller => 'frank_profiles',
                                             :relationship => 'frank_entries',
                                             :action => 'show_relationship',
                                             :frank_profile_id => '1'
                                         )
      end
    end
  end

  context 'JSON requests' do

    describe 'frank-profiles' do

      it 'create does not require first name' do
        @request.headers['Content-Type'] = 'application/vnd.api+json'
        json = {
            :data => {
                :type => 'frank-profiles',
                attributes: {
                    :email => email
                }
            }
        }
        post :create, json
        expect(response.status).to eq(201)
        expect(Frank::Profile.count).to eq(1)
        expect(Frank::Profile.first.email).to match(email)
      end

      it 'should be success' do
        @request.headers['Content-Type'] = 'application/vnd.api+json'
        json = {
                :data => {
                    :type => 'frank-profiles',
                    attributes: {
                        :firstname => firstname,
                        :lastname => lastname,
                        :email => email
                    }
                }
        }
        post :create, json
        expect(response.status).to eq(201)
        expect(Frank::Profile.count).to eq(1)
        expect(Frank::Profile.first.firstname).to match(firstname)
        expect(Frank::Profile.first.lastname).to match(lastname)
        expect(Frank::Profile.first.email).to match(email)
      end
    end
  end
end
