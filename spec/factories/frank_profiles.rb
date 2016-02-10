FactoryGirl.define do
  factory :frank_profile, :class => 'Frank::Profile' do
    firstname { Faker::Name.first_name }
    lastname  { Faker::Name.last_name }
    email { Faker::Internet.email }
    phone { Faker::PhoneNumber.phone_number }
  end

end
