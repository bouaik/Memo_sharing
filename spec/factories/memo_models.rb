FactoryBot.define do
  factory :memo do
    body { Faker::Lorem.paragraph }
  end
end
