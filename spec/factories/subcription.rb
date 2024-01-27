require "faker"

FactoryBot.define do
  factory :subscription do
    association :customer

    title { Faker::Ancient.primordial }
    price { Faker::Number.decimal(l_digits: 2) }
    status { %w[active inactive].sample }
    frequency { [15, 30, 60, 90].sample }
  end
end
