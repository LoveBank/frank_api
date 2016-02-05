FactoryGirl.define do
  factory :entry do
    note { Faker::Lorem.paragraph }
    rating { Faker::Number.between(1, 5)}
    private false
  end

end
