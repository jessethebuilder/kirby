FactoryGirl.define do
  ::PW = 'Password123'
  sequence(:email){ |x| "test#{x}@test.com"}

  factory :post do
    title Faker::Lorem.words.join(' ').titlecase
    user
  end

  factory :user do
    email
    password PW
    first_name Faker::Name.name
  end

  factory :comment do
    user
    post
  end
end
