FactoryGirl.define do
  factory :user do
    email 'demo@demo.com'
    name 'Demo'
    password '12345678'
    role 'user'
  end
end
