FactoryBot.define do
  factory :order_address do
    postal_code   {'123-4567'}
    prefecture_id {2}
    city          {'京都府'}
    block_number  {'1-1'}
    building_name {'マンション'}
    phone_number  {'09012345678'}
  end
end
