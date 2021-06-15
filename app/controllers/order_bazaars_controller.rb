class OrderBazaarsController < ApplicationController
  before_action :set_bazaar, only: [:new, :create]

  def new
    @order_bazaar = OrderBazaar.new
  end

  def create
    @order_bazaar = OrderBazaar.new(order_bazaar_params)
    if @order_bazaar.save
    else
      render :new
    end
  end

  def show
    @order_bazaar = OrderBazaar.find(params[:bazaar_id])
  end


  private

  def order_bazaar_params
    params.require(:order_bazaar).permit(:quantity).merge(user_id: current_user.id, bazaar_id: @bazaar.id)
  end

  def set_bazaar
    @bazaar = Bazaar.find(params[:bazaar_id])
  end

end
