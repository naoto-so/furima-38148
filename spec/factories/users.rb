FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.name }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    second_name           { Faker::Name.last_name } # 漢字・かな・カナ
    first_name            { Faker::Name.first_name } # 漢字・かな・カナ
    second_name_kana      { Faker::Name.last_name } # カナ
    first_name_kana       { Faker::Name.first_name } # カナ
    date_of_birth         { Faker::Date.between(from: '1930-01-01', to: '2017-12-31') }
  end
end
