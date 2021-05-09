class BuysController < ApplicationController
 before_action :authenticate_user!, only: [:index, :create]
 before_action :buy_item, only: [:create, :index]
 before_action :buy_case, only: [:create, :index, :update, :destroy]
 def index
  @address_buy = AddressBuy.new
 end

 def create
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
  params.require(:address_buy).permit(:postcode, :prefecture_id, :city, :block, :building, :phone_number, :address).merge(token: params[:token], item_id: params[:item_id], user_id: current_user.id)
 end

 def pay_item
   Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: buy_params[:token],
      currency: 'jpy'
    )
 end

 def buy_item
  @item = Item.find(params[:item_id])
 end

 def buy_case
    if current_user.id == @item.user_id ||  @item.buy.present? 
      redirect_to root_path
    end
 end



end
