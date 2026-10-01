FactoryBot.define do
    factory :subscriber do
        association :product
        sequence(:email) { |n| "subscriber#{n}@example.com" }
    end
end