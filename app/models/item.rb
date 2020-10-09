class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :status
  belongs_to_active_hash :category
  belongs_to_active_hash :burden
  belongs_to_active_hash :area
  belongs_to_active_hash :shipment
  has_one_attached :image
  belongs_to :user
  

   validates :image, presence: true  
   validates :item_name, presence: true
   validates :description, presence: true  
   validates :price, presence: true, numericality: { only_integer: true,greater_than: 299, less_than: 10000000}
   validates :status_id, presence:true, numericality: { other_than: 1 }
   validates :category_id, presence: true, numericality: { other_than: 1 } 
   validates :burden_id, presence: true, numericality: { other_than: 1 } 
   validates :area_id, presence: true, numericality: { other_than: 1 } 
   validates :shipment_id, presence: true, numericality: { other_than: 1 } 


end
