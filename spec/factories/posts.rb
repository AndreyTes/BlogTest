require 'faker'

FactoryBot.define do
  factory :post do
    user
    title { Faker::Science.element }
    description { Faker::Science.element_symbol }
  end
end
