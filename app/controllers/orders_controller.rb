class OrdersController < ApplicationController
  before_action :Item_find, only: [:index, :create ]

  def index
    @user_order = UserOrder.new
    if user_signed_in? && current_user.id == @item.user_id
      redirect_to root_path
    end
  end


  def create
    @user_order = UserOrder.new(order_address_params)
    if @user_order.valid?
      pay_item
      @user_order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end


  private 

  def order_address_params
    params.permit(:token, :postal_code, :prefecture_id, :municipality, :address, :building, :telephone, :item_id).merge(user_id: current_user.id)
  end

  
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item.price, # 商品の値段
      card: order_address_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end

  def Item_find
    @item = Item.find(params[:id])
  end


end
