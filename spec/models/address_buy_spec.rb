require 'rails_helper'

RSpec.describe AddressBuy, type: :model do
 describe '購入情報の保存' do
  before do
   user = FactoryBot.create(:user)
   item = FactoryBot.create(:item)
   @address_buy = FactoryBot.build(:address_buy, user_id: user.id, item_id: item.id)
   sleep 1
  end

  context '内容に問題がない場合' do
   it '全ての値が正しく入力されていれば保存できること' do
    expect(@address_buy).to be_valid
   end
   
   it "tokenがあれば保存できること" do
    expect(@address_buy).to be_valid
   end

   it "buildingが空でも登録できる" do
    @address_buy.building= ''
    expect(@address_buy).to be_valid
   end

  end

  context '内容に問題がある場合' do
   it 'postcodeが空だと保存できないこと' do
    @address_buy.postcode = ''
    @address_buy.valid?
    expect(@address_buy.errors.full_messages).to include("Postcode can't be blank")
   end
   it 'postcodeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
    @address_buy.postcode = "12345678"
    @address_buy.valid?
    expect(@address_buy.errors.full_messages).to include('Postcode is invalid. Include hyphen(-)')
   end
   it 'prefecture_idを選択していないと保存できないこと' do
    @address_buy.prefecture_id = 1
    @address_buy.valid?
    expect(@address_buy.errors.full_messages).to include("Prefecture can't be blank")
   end
   it 'cityは空では保存できないこと' do
    @address_buy.city = ''
    @address_buy.valid?
    expect(@address_buy.errors.full_messages).to include("City can't be blank")
   end
   it 'blockは空では保存できないこと' do
    @address_buy.block = ''
    @address_buy.valid?
    expect(@address_buy.errors.full_messages).to include("Block can't be blank")
   end
   it 'userが紐付いていないと保存できないこと' do
    @address_buy.user_id = nil
    @address_buy.valid?
    expect(@address_buy.errors.full_messages).to include("User can't be blank")
   end
   it "tokenが空では登録できないこと" do
    @address_buy.token = nil
    @address_buy.valid?
    expect(@address_buy.errors.full_messages).to include("Token can't be blank")
   end
   it 'itemが紐付いていないと保存できないこと' do
    @address_buy.item_id = nil
    @address_buy.valid?
    expect(@address_buy.errors.full_messages).to include("Item can't be blank")
   end
   it 'phone_numberが空では保存できないこと' do
    @address_buy.phone_number= ''
    @address_buy.valid?
    expect(@address_buy.errors.full_messages).to include("Phone number can't be blank")
   end
   it 'phone_numberは数字のみでないと保存できない' do
    @address_buy.phone_number= 'ああああああ'
    @address_buy.valid?
    expect(@address_buy.errors.full_messages).to include('Phone number is invalid')
   end
   it 'phone_numberは11桁以内でないと保存できない' do
    @address_buy.phone_number= "123456789111"
    @address_buy.valid?
    expect(@address_buy.errors.full_messages).to include('Phone number is too long')
   end
   it 'phone_numberが英数混合では登録できないこと' do
    @address_buy.phone_number= "abc12345def"
    @address_buy.valid?
    expect(@address_buy.errors.full_messages).to include('Phone number is invalid')
   end
   it 'phone_numberは10桁以内でないと保存できない' do
    @address_buy.phone_number= "123456789111"
    @address_buy.valid?
    expect(@address_buy.errors.full_messages).to include('Phone number is too long')
   end
  end
 end
end