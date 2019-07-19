# frozen_string_literal: true

FactoryBot.define do
  factory :coupom do
    user { '' }
    value { '9.99' }
    used { false }
  end
end
