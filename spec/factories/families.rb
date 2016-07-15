FactoryGirl.define do
  factory :family, :class => 'Family' do
    name { Faker::Name.name }
  end

end
