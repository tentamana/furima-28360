class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :status
  belongs_to_active_hash :category
  belongs_to_active_hash :burden
  belongs_to_active_hash :area
  belongs_to_active_hash :shipment
  has_one_attached :item_image
  belongs_to :user
  # has_one :shopping

   validates :item_image, presence: true  
   validates :item_name, presence: true
   validates :description, presence: true  
   validates :price, presence: true,format: {with: /\A[0-9]+\z/} ,numericality: { only_integer: true,greater_than: 300, less_than: 9999999}
   validates :status_id, presence:true, numericality: { other_than: 1 }
   validates :category_id, presence: true, numericality: { other_than: 1 } 
   validates :burden_id, presence: true, numericality: { other_than: 1 } 
   validates :area_id, presence: true, numericality: { other_than: 1 } 
   validates :shipment, presence: true, numericality: { other_than: 1 } 


end
