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

  context 'when params[:email] == email' do
    let(:user) { FactoryGirl.create(:profile) }

    it 'filters results by email with empty results' do
      @request.headers['Content-Type'] = JSONAPI::MEDIA_TYPE
      get :index, {filter: {email: 'does not exist'}}
      expect(response.status).to eq(200)
      expect(JSON.parse(response.body)['data'].is_a?(Array))
      expect(JSON.parse(response.body)['data'].size).to eql 0
    end

    it 'filters results by email finds a match' do
      @request.headers['Content-Type'] = JSONAPI::MEDIA_TYPE
      get :index, {filter: {email: user.email}}
      expect(response.status).to eq(200)
      expect(JSON.parse(response.body)['data'].is_a?(Array))
      expect(JSON.parse(response.body)['data'].size).to eql 1
    end

    it 'filters results by email finds a match case insensitive' do
      @request.headers['Content-Type'] = JSONAPI::MEDIA_TYPE
      get :index, {filter: {email: user.email.capitalize}}
      expect(response.status).to eq(200)
      expect(JSON.parse(response.body)['data'].is_a?(Array))
      expect(JSON.parse(response.body)['data'].size).to eql 1
    end

  end

  context 'JSON requests' do

    describe 'profiles' do

      it 'should be success' do
        @request.headers['Content-Type'] = JSONAPI::MEDIA_TYPE
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

        expect(Profile.count).to eq(1)
        expect(response.status).to eq(201)
        expect(Profile.first.firstname).to match(firstname)
        expect(Profile.first.lastname).to match(lastname)
        expect(Profile.first.email).to match(email)
      end

    end

    describe 'existing profiles' do
      let(:user) {FactoryGirl.create(:profile)}

      it 'case insensitive match on creation' do
        user.save!

        @request.headers['Content-Type'] = JSONAPI::MEDIA_TYPE
        json = {
            :data => {
                :type => 'profiles',
                attributes: {
                    :firstname => user.firstname,
                    :lastname => user.lastname,
                    :email => user.email.capitalize
                }
            }
        }
        post :create, json
        expect(Profile.count).to eq(1)
        expect(response.status).to eq(422)
      end
    end

    describe 'invalid requests' do
      it 'should be missing the first name' do
        @request.headers['Content-Type'] = JSONAPI::MEDIA_TYPE
        json = {:format => JSONAPI::MEDIA_TYPE,
                :data => {
                    :type => 'profiles',
                    attributes: {
                        :lastname => lastname,
                        :email => email
                    }
                }
        }
        post :create, json
        expect(Profile.count).to eq(0)
        expect(response.status).to eq(422)
        expect(response.body).to include("firstname - can't be blank")
      end

      it 'should be missing the last name' do
        @request.headers['Content-Type'] = JSONAPI::MEDIA_TYPE
        json = {:format => JSONAPI::MEDIA_TYPE,
                :data => {
                    :type => 'profiles',
                    attributes: {
                        :firstname => firstname,
                        :email => email
                    }
                }
        }
        post :create, json
        expect(Profile.count).to eq(0)
        expect(response.status).to eq(422)
        expect(response.body).to include("lastname - can't be blank")
      end

      it 'should be missing email' do
        @request.headers['Content-Type'] = JSONAPI::MEDIA_TYPE
        json = {:format => JSONAPI::MEDIA_TYPE,
                :data => {
                    :type => 'profiles',
                    attributes: {
                        :firstname => firstname,
                        :lastname => lastname
                    }
                }
        }
        post :create, json
        expect(Profile.count).to eq(0)
        expect(response.status).to eq(422)
        expect(JSON.parse(response.body)['errors'].length).to eq(1)
      end

    end

  end
end
