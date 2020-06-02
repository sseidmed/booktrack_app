require 'faker'
FactoryBot.define do
  factory :book do |f|
    f.title { Faker::Book.title }
    f.author { Faker::Book.author }

  end
end
