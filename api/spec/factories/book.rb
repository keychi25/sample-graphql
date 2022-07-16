FactoryBot.define do
  factory :book do
    sequence(:title) { |n| "book_tilte_name_#{n}" }
  end
end
