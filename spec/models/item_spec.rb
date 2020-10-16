require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
      
    end

    it "item_name,image,description,price,status,category,burden,area,shipmentが存在すれば登録できること" do
      expect(@item).to be_valid
    end
    it "item_nameが空では登録できないこと" do
      @item.item_name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Item name can't be blank")
    end

    it "imageが空では登録できないこと" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it "descriptionが空では登録できないこと" do
      @item.description = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end

    it "priceが空では登録できないこと" do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it "priceが半角数字であれば登録できること" do
      @item.price = "123"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than 299")
    end

    it "priceが300円以下であれば登録できないこと" do
      @item.price = "299"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than 299")
    end

    it "priceが9999999円以上であれば登録できないこと" do
      @item.price = "10000000"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than 10000000")
    end

    it "status_idが空では登録できないこと" do
      @item.status_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Status must be other than 1")
    end

    it "category_idが空では登録できないこと" do
      @item.category_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 1")
    end

    it "burden_idが空では登録できないこと" do
      @item.burden_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Burden must be other than 1")
    end

    it "area_idが空では登録できないこと" do
      @item.area_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Area must be other than 1")
    end
    it "shipment_idが空では登録できないこと" do
      @item.shipment_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipment must be other than 1")
    end
  end
end

