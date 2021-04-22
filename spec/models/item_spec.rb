require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品の保存' do

    context "商品出品の保存ができる場合" do
      it "全てのカラムが揃っていれば登録できること" do
        @item = FactoryBot.build(:item)
        expect(@item).to be_valid
      end
    end

    context "商品出品の保存ができない場合" do
      it "画像が空だと保存できない" do
        @item.image = nil
        @item.valid?
         expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it "商品名が空だと保存できない" do
         @item.name = ""
         @item.valid?
         expect(@item.errors.full_messages).to include("Name can't be blank")
      end
       
      it "商品の説明が空だと保存できない" do
        @item.text = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end
      it "カテゴリーが空だと保存できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it "商品の状態が空だと保存できない" do
        @item.item_condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Item condition must be other than 1")
      end
      it "配送料の負担が空だと保存できない" do
        @item.tax_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Tax must be other than 1")
      end
      it "発送元の地域が空だと保存できない" do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it "発送までの日数が空だと保存できない" do
        @item.send_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Send day must be other than 1")
      end
      it "価格が空だと保存できない" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'ユーザーが紐付いていなければ投稿できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
      it "販売価格が300円以下だと保存できない" do
        @item.price = 200
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it "販売価格が9,999999円以上だと保存できない" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      it "販売価格が全角数字では出品できない" do
       @item.price = "００あ１h"
       @item.valid?
       expect(@item.errors.full_messages).to include("Price is not a number")
      end
    end
  end
end
