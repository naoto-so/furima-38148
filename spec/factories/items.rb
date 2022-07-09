FactoryBot.define do
  factory :item do
    item_name          { Faker::Lorem.word }
    explanation        { Faker::Lorem.sentence }
    category_id        { '2' }
    condition_id       { '2' }
    delivery_charge_id { '2' }
    send_area_id       { '2' }
    send_day_id        { '2' }
    price              { Faker::Number.between(from: 300, to: 9_999_999) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.jpeg'), filename: 'test_image.jpeg')
    end
  end
end
