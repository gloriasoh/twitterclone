FactoryBot.define do
  factory :user do
    name 'Full Name'
    sequence :email { |n| "email#{n}@example.com"}
    password '123456'

  end
end
