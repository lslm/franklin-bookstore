FactoryBot.define do
  factory :credit_card do
    user { nil }
    number { "MyString" }
    name { "MyString" }
    expire { "MyString" }
    cvc { "MyString" }
  end
end
