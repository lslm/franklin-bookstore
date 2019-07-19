# frozen_string_literal: true

FactoryBot.define do
  factory :feature_toggle do
    name { 'MyString' }
    active { false }
  end
end
