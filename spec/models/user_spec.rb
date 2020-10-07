require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    it "nicknameとemail、name,kana,birthday,passwordとpassword_confirmationが存在すれば登録できること" do
      expect(@user).to be_valid
    end
    
    it "nicknameが空では登録できないこと" do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    
    it "nameが空では登録できないこと" do
      @user.name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Name can't be blank")
    end
    

    it "last_nameが空では登録できないこと" do
      @user.last_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank", "Last name is invalid")
    end
    
    
    describe '#ぜんかく' do

      it "nameが全角文字でないならば登録できない" do
        @user = FactoryBot.build(:user, name: "abc")
        @user.valid?
        expect(@user.errors.full_messages).to include("Name is invalid")
      end
  
      it "last_nameが全角文字でないならば登録できない" do
        @user = FactoryBot.build(:user, last_name: "abc")
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end
  
    end
  

    it "name_kanaが空では登録できないこと" do
      @user.name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Name kana can't be blank", "Name kana is invalid")
    end

    

    it "last_name_kanaが空では登録できないこと" do
      @user.last_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank", "Last name kana is invalid")
    end

    
    describe '#ゼンカクカナ' do

      it "name_kanaが全角カナ文字であれば登録できること" do
        @user = FactoryBot.build(:user, name_kana: "abc")
        @user.valid?
        expect(@user.errors.full_messages).to include("Name kana is invalid")
      end
  
      it "last_name_kanaが全角カナ文字であれば登録できること" do
        @user = FactoryBot.build(:user, last_name_kana: "abc")
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid")
      end
  
    end
  


    it "emailが空では登録できないこと" do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "重複したemailが存在する場合登録できないこと" do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end

    it "birthdayが空では登録できないこと" do
      @user.birthday = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end

    it "passwordが空では登録できないこと" do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "passwordが6文字以上であれば登録できること" do
      @user.password = "abc456"
      @user.password_confirmation = "abc456"
      expect(@user).to be_valid
    end

    it "passwordが5文字以下であれば登録できないこと" do
      @user.password = "12345"
      @user.password_confirmation = "12345"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it "passwordが数字のみの場合は登録できないこと" do
      @user = FactoryBot.build(:user, password: "1234567", password_confirmation: "1234567")
      @user.valid?
      expect(@user.errors[:password]).to include("is invalid")
    end

    it "passwordが英文字のみの場合は登録できないこと" do
      @user = FactoryBot.build(:user, password: "abcdefg", password_confirmation: "abcdefg")
      @user.valid?
      expect(@user.errors[:password]).to include("is invalid")
    end

    
    it "passwordとpassword_confirmationが一致していない場合は登録できないこと" do
      @user = FactoryBot.build(:user, password: "abcd123", password_confirmation: "1234abc")
      @user.valid?
      expect(@user.errors[:password_confirmation]).to include("doesn't match Password")
    end


    
  end
end


