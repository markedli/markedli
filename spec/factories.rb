FactoryGirl.define do
  factory :user do
    sequence(:username) {|n| "testing#{n}" }
    sequence(:email) {|n| "testing#{n}@factory.com" }
    password "simplepass"
    password_confirmation "simplepass"
  end
  factory :client_application do
    name "My Client App"
    description "A short description"
  end
  factory :access_grant do
    user
    client_application
  end
end
