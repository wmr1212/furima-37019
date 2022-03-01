class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @purchase_history = PurchaseHistory.new
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase_history = PurchaseHistory.new(order_params)
    if @purchase_history.valid?
      @purchase_history.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:purchase_history).permit(:shipping_area_id, :post_code, :city, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def item_params
    params.require(:item).permit(:name, :explanation, :condition_id, :category_id, :price, :user, :delivery_charge_id, :shipping_area_id, :trading_status_id, :image).merge(user_id: current_user.id)
  end

end
