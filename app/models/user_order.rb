class UserOrder
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :municipality, :address, :building, :telephone, :token, :item_id, :user_id

        with_options presence: true do
          validates :postal_code 
          validates :prefecture_id
          validates :municipality  
          validates :address
          validates :telephone
         end
      
        
        validates :token, presence: true
        validates :telephone, format: { with: /\A\d{11}\z/ }


        def save
          order = Order.create(item_id: item_id, user_id: user_id)
          Address.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, address: address, building: building, order_id: order.id)
        end
end