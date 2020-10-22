class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to :orders

  validates :prefecture_id, numericality: { other_than: 1 } 
end
