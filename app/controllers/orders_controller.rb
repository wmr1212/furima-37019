class OrdersController < ApplicationController
  
  before_action :authenticate_user!
  before_action :soldout_confimation

  def index
    @item = Item.find(params[:item_id])
    @purchase_history = PurchaseHistory.new
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase_history = PurchaseHistory.new(order_params)
    if @purchase_history.valid?
      pay_item
      @purchase_history.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:purchase_history).permit(:shipping_area_id, :post_code, :city, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def item_params
    params.require(:item).permit(:name, :explanation, :condition_id, :category_id, :price, :user, :delivery_charge_id, :shipping_area_id, :trading_status_id, :image).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def soldout_confimation
    redirect_to root_path unless @item.order.blank?
  end

end
