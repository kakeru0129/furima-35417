FactoryBot.define do
  factory :order_address do
    postal_code   {'123-4567'}
    area_id       {2}
    city          {'京都府'}
    block_number  {'1-1'}
    building_name {'マンション'}
    phone_number  {'09012345678'}
    token         {"tok_abcdefghijk00000000000000000"}
  end
end
