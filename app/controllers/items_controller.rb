class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
  end

  private

  def item_params
    params.require(:item),permit(:name, :explanation, :condition_id, :category_id, :price, :user, :delivery_charge_id, :shipping_area_id, :trading_status_id, :image)
  end

end
