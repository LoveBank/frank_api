FactoryGirl.define do
  factory :mood, :class => 'Mood' do
    note { Faker::Lorem.paragraph }
    rating { Faker::Number.between(1, 5)}
  end

end
