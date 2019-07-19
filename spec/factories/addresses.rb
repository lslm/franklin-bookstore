# frozen_string_literal: true

FactoryBot.define do
  factory :address do
    user { '' }
    street { '' }
    number { '' }
    zip_code { '' }
    city { '' }
    state { '' }
    type { '' }
  end
end
