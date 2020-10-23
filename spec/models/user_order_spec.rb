require 'rails_helper'

RSpec.describe UserOrder, type: :model do
  describe '#create' do
    before do
      seller = FactoryBot.build(:user)
      @item = FactoryBot.build(:item, user_id: seller.id)
      buyer = FactoryBot.build(:user)
      @user_order = FactoryBot.build(:user_order, user_id: buyer.id, item_id: seller.id)

      
    end
  
    it "tokenが空では登録できないこと" do
      @user_order.token = nil
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Token can't be blank")
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@user_order).to be_valid
    end

    it 'postal_codeが空だと保存できないこと' do
      @user_order.postal_code = nil
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Postal code can't be blank")
    end

    it "postal_codeにハイフンが含まれたら保存できること" do
      @user_order.postal_code = "123-4567"
      expect(@user_order).to be_valid
    end

    it 'prefecture_idが空だと保存できないこと' do
      @user_order.prefecture_id = nil
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Prefecture can't be blank")
    end

    it 'municipalityが空だと保存できないこと' do
      @user_order.municipality = nil
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Municipality can't be blank")
    end

    it 'addressが空だと保存できないこと' do
      @user_order.address = nil
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Address can't be blank")
    end


    it 'telephoneが空だと保存できないこと' do
      @user_order.telephone = nil
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Telephone can't be blank")
    end

    it "telephoneが11文字以上であれば登録できないこと" do
      @user_order.telephone = "123456789012"
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Telephone is invalid")
    end

    it "telephoneにハイフンが含まれたら登録できないこと" do
      @user_order.telephone = "1234-678-90"
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Telephone is invalid")
    end
  end


end

# bundle exec rspec spec/models/user_order_spec.rb