FactoryGirl.define do
  factory :frank_post, :class => 'Frank::Post' do
    title "MyString"
    body "MyText"
    profile nil
  end

end
