class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  

  def index
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new
    if @item.order.present?
      redirect_to root_path
    end  
    if @item.user_id == current_user.id
      redirect_to root_path
    end
  end  

  def create
    @item = Item.find(params[:item_id])
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

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  
      card: order_params[:token],    
      currency: 'jpy'                 
    )
  end    

  
   

end
