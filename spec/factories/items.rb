FactoryBot.define do
  factory :item do
    item_name{"iphone11"} 
    item_image
    category_id{"3"}
    price{"300"}
    description{"新作iPhoneです"}
    status_id{"2"}
    burden_id{"2"}
    area_id{"2"}
    shipment_id{"2"}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
