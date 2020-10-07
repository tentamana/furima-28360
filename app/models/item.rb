class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :status, :category, :burden, :area, :shipment
  has_one_attached :item_image

   #空の投稿を保存できないようにする
   validates :item_image, :item_name, :price, :description, :status, :category, :burden, :area, :shipment presence: true

   #商品状態の選択が「--」の時は保存できないようにする
   validates :status_id, numericality: { other_than: 1 }
   #カテゴリーの選択が「--」の時は保存できないようにする
   validates :category_id, numericality: { other_than: 1 } 
   #配送料の選択が「--」の時は保存できないようにする
   validates :burden_id, numericality: { other_than: 1 } 
   #配送地域の選択が「--」の時は保存できないようにする
   validates :area_id, numericality: { other_than: 1 } 
   #配送日の選択が「--」の時は保存できないようにする
   validates :shipment, numericality: { other_than: 1 } 


end
