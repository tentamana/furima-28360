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

    it "priceがであれば半角数字であれば登録できること" do
      @item.price = "あいう"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
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
      @item.status_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Status can't be blank", "Status is not a number")
    end

    it "category_idが空では登録できないこと" do
      @item.category_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank", "Category is not a number")
    end

    it "burden_idが空では登録できないこと" do
      @item.burden_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Burden can't be blank", "Burden is not a number")
    end

    it "area_idが空では登録できないこと" do
      @item.area_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Area can't be blank", "Area is not a number")
    end
    it "shipment_idが空では登録できないこと" do
      @item.shipment_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipment can't be blank", "Shipment is not a number")
    end
  end
end

