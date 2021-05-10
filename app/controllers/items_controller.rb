class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :destroy, :update, :create, :edit]
  before_action :set_item, only: [:show, :update, :edit, :destroy]
  before_action :redirect_item, only: [:edit, :update, :destroy]

  def index
    @items= Item.includes(:user).order("created_at DESC")
  end

  def new
   @item = Item.new
  end

  

  def show 
  end

  def update
   if @item.update(item_params)
     redirect_to item_path
   else
     render :edit
   end
  end

  def edit
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  def create
    @item = Item.new(item_params)
   if @item.save
     redirect_to root_path
   else
     render :new
   end
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end


  def redirect_item
    unless user_signed_in? && @item.buy.nil? 
      redirect_to action: :index
     end
  end




  def item_params
    params.require(:item).permit(:image, :category_id, :item_condition_id, :prefecture_id, :send_day_id, :tax_id,:name,:text,:price).merge(user_id: current_user.id)
  end
end
