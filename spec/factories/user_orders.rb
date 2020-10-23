FactoryBot.define do
  factory :user_order do

      postal_code { '123-4567' }
      prefecture_id { 2 }
      municipality { '東京都' }
      address { '1-1' }
      building { '東京ハイツ' }
      telephone {'09012345678'}
      token{ 'tok_abcdefghijk00000000000000000' }
      
  end
end
