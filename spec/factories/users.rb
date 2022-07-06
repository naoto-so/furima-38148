FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.name }
    email                 { Faker::Internet.free_email }
    password              { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    second_name           { Faker::Japanese::Name.last_name } # 漢字・かな・カナ
    first_name            { Faker::Japanese::Name.first_name } # 漢字・かな・カナ
    second_name_kana      { 'セイ' } # カナ
    first_name_kana       { 'メイ' } # カナ
    date_of_birth         { Faker::Date.between(from: '1930-01-01', to: '2017-12-31') }
  end
end
