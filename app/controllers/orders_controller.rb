class OrdersController < ApplicationController

  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create]
  before_action :contributor_confirmation, only: [:index, :create]
  before_action :soldout_confimation, only: [:index, :create]

  def index
    @purchase_history = PurchaseHistory.new
  end

  def create
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

  def set_item
    @item = Item.find(params[:item_id])
  end

  def contributor_confirmation
    redirect_to root_path unless current_user != @item.user
  end

end
