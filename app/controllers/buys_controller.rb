class BuysController < ApplicationController
 before_action :authenticate_user!, only: :index
 def index
  @address_buy = AddressBuy.new
  @item = Item.find(params[:item_id])
 end

 def create
  @item = Item.find(params[:item_id])
  @address_buy = AddressBuy.new(buy_params)
  if @address_buy.valid?
     pay_item
    @address_buy.save
    redirect_to root_path
    else
    render :index
   end
 end


 private

 def buy_params
  params.require(:address_buy).permit(:postcode, :prefecture_id, :city, :block, :building, :phone_number, :address, :price).merge(token: params[:token], item_id: params[:item_id], user_id: current_user.id)
 end

 def pay_item
   Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: buy_params[:token],
      currency: 'jpy'
    )
 end


end
