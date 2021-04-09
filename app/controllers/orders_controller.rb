class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :making, only: [:index, :create]
  before_action :move_root, only: [:index, :create]

  def index
    @order_address = OrderAddress.new
  end  

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render :index
    end 
  end
  
  private

  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number, :user_id, :item_id ).merge(token: params[:token], user_id: current_user.id, item_id: params[:item_id])
  end  

  def making
    @item = Item.find(params[:item_id])
  end  

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  
      card: order_params[:token],    
      currency: 'jpy'                 
    )
  end  
  
  def move_root
    if @item.order.present? || @item.user_id == current_user.id
      redirect_to root_path
    end
  end  

  
   

end
