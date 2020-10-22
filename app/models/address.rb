class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to :orders

  with_options presence: true do
    validates :postal_code 
    validates :prefecture_id
    validates :municipality  
    validates :address
    validates :building
    validates :telephone
   end

  validates :prefecture_id, numericality: { other_than: 1 } 
end
