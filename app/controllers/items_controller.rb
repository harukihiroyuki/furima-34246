class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :destroy, :update, :create, :edit]

  def index
   # @user = User.all
  end

  def new
  @item = Item.new
  end

  def create
    @item = Item.new(item_params)
   if @item.save
     redirect_to root_path
   else
     render :new
   end
  end


  def item_params
    params.require(:item).permit(:image, :category_id, :item_condition_id, :prefecture_id, :send_day_id, :tax_id,:name,:text,:price).merge(user_id: current_user.id)
  end
end
