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
    @bazaar = Bazaar.find(params[:id])
    @order = OrderBazaar.find(params[:bazaar_id])
    @contact = ContactBazaar.new
    @contacts = @order.contact_bazaars.order('created_at DESC')
  end


  private

  def order_bazaar_params
    params.require(:order_bazaar).permit(:quantity).merge(user_id: current_user.id, bazaar_id: @bazaar.id)
  end

  def set_bazaar
    @bazaar = Bazaar.find(params[:bazaar_id])
  end

end
