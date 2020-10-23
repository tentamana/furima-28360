FactoryBot.define do
  factory :user do
    nickname {"furima太郎"}
    last_name {"山田"}
    name {"太郎"}
    last_name_kana{"ヤマダ"}
    name_kana{"タロウ"}
    email {Faker::Internet.email}
    birthday {Faker::Date.birthday}
    password {"aa111111111"}
    password_confirmation {password}
  end
end