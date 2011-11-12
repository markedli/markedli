FactoryGirl.define do
  factory :user do
    sequence(:username) {|n| "testing#{n}" }
    sequence(:email) {|n| "testing#{n}@factory.com" }
    password "simplepass"
    password_confirmation "simplepass"
  end
end
