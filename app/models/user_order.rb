class UserOrder
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture, :municipality, :address, :building, :telephone, :token, :item_id, :user_id

        with_options presence: true do
          validates :postal_code 
          validates :prefecture_id
          validates :municipality  
          validates :address
          validates :building
          validates :telephone
         end
      
        validates :prefecture_id, numericality: { other_than: 1 } 
        validates :token, presence: true

        def save
          Address.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, address: address, building: building,user_id: user.id)
          Order.create(item_id: item_id, user_id: user.id, token: token)
        end
end