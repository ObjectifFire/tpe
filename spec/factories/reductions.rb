FactoryBot.define do
  factory :reduction do
    amount { 50 }
    product { association(:product) }
  end
end
