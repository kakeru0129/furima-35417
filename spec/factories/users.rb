FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {Faker::Internet.free_email}
    password              {'1a' + Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    first_name            {'阿'}
    last_name             {'阿'}
    first_name_kana       {'ア'}
    last_name_kana        {'ア'}
    birthday              {'1930-01-01'}
  end
end