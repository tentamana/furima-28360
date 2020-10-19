class ItemsController < ApplicationController
   before_action :authenticate_user!,only: [:new, :create, :edit, :update]
   before_action :Item_find, only: [:show, :edit, :update]
   before_action :redirect_show, only: [:edit, :update]
   

   def index
     @items = Item.all.order("created_at DESC")
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

  def show
  end

  def edit
  end

  def update
    @item.update(item_params)
      if @item.save
        redirect_to item_path
      end
  end


  private

  def item_params
    params.require(:item).permit(:item_name,:image,:category_id,:price,:description,:status_id,:burden_id,:area_id,:shipment_id).merge(user_id: current_user.id)
  end

  def Item_find
    @item = Item.find(params[:id])
  end

  def redirect_show
    if user_signed_in? && current_user.id != @item.user_id
     redirect_to item_path
    end

  end

end

