FactoryGirl.define do
  factory :entry, :class => 'Entry' do
    note { Faker::Lorem.paragraph }
    rating { Faker::Number.between(1, 5)}
    private false
  end

end
