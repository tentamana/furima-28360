class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :status
  belongs_to_active_hash :category
  belongs_to_active_hash :burden
  belongs_to_active_hash :area
  belongs_to_active_hash :shipment
  has_one_attached :image
  belongs_to :user
  
  with_options presence: true do
   validates :image 
   validates :item_name
   validates :description  
   validates :price
   validates :status_id
   validates :category_id
   validates :burden_id
   validates :area_id
   validates :shipment_id
  end


  with_options numericality: {other_than: 1} do
    validates :status_id
    validates :category_id
    validates :burden_id
    validates :area_id
    validates :shipment_id
  end

  validates :price, numericality: { only_integer: true, greater_than: 299, less_than: 10000000}
  
end
