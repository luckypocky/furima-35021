class ItemsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_item, only: [:edit, :show, :update, :destroy]
  before_action :move_root, only: [:edit, :update, :destroy]
  before_action :redirect_root, only: [:edit, :update, :destroy]
  
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
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit  
    end  
  end  

  def destroy
     if @item.destroy
      redirect_to root_path
     else
      render :index
     end 
  end  
  
  private

  def item_params
    params.require(:item).permit(:item_name, :explanation, :category_id, :condition_id, :charge_id, :prefecture_id, :numberday_id, :image, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end  

  def move_root
    unless @item.user_id == current_user.id
      redirect_to root_path
    end  
  end

  def redirect_root
    if @item.order.present?
      redirect_to root_path
    end 
  end  
  
end
