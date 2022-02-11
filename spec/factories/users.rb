FactoryBot.define do
  factory :user do
    nickname {Faker::Name.name}
    email {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
    first_name {'宏樹'}
    family_name {'田中'}
    first_name_kana {'コウキ'}
    family_name_kana {'タナカ'}
    birth_date {'1993-08-09'}
  end
end