FactoryBot.define do
  factory :order_address do
    post_number    { '123-4567' }
    send_area_id   { '2' }
    city           { '札幌市' }
    address_number { '番地1-1' }
    building       { 'ビル' }
    tel            { '12345678901' }
    token          {"tok_abcdefghijk00000000000000000"}
  end
end

