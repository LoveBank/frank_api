FactoryGirl.define do
  factory :love_bank, :class => 'LoveBank' do
    note { Faker::Lorem.paragraph }
    rating { Faker::Number.between(1, 5)}
  end

end
