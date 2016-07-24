FactoryGirl.define do
  factory :entry, :class => 'Entry' do
    note { Faker::Lorem.paragraph }
    rating { Faker::Number.between(1, 5)}
    private false
    received true
    created_at { 0.day.ago }
    updated_at { 0.day.ago }
  end
end
