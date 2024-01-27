require "faker"

FactoryBot.define do
  factory :tea do
    title { Faker::Ancient.primordial }
    description { Faker::Lorem.sentence }
    temperature { Faker::Number.between(from: 100, to: 160) }
    brew_time { Faker::Number.between(from: 10, to: 15) }
  end
end
