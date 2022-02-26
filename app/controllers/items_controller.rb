class ItemsController < ApplicationController

  before_action :authenticate_user!, except: [:show, :index]

  def index
    @items = Item.all.order(created_at: :desc)
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
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end
  
  private

  def item_params
    params.require(:item).permit(:name, :explanation, :condition_id, :category_id, :price, :user, :delivery_charge_id, :shipping_area_id, :trading_status_id, :image).merge(user_id: current_user.id)
  end

end
