require 'faker'

FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    name { Faker::Internet.user_name }
    password { 'password' }
    password_confirmation { 'password' }
  end
end
