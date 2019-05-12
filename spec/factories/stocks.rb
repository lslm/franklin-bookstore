FactoryBot.define do
  factory :stock do
    product { nil }
    quantity { 1 }
    price { "9.99" }
    lot { "MyString" }
  end
end
