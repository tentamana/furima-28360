class ItemsController < ApplicationController
  # before_action :authenticate_user!
  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @items = Item.new
  end

  def create
    @items = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:item_name,:item_image,:category_id,:price,:description,:status_id,:burden_id,:area_id,:shipment_id)
  end
end
