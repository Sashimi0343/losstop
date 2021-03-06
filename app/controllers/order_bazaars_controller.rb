class OrderBazaarsController < ApplicationController
  before_action :set_bazaar, only: %i[new create destroy]
  before_action :authenticate_user!, only: %i[new create]

  def new
    @order_bazaar = OrderBazaar.new
  end

  def create
    @order_bazaar = OrderBazaar.new(order_bazaar_params)
    if @bazaar.stock >= @order_bazaar.quantity
      @bazaar.update_columns(stock: @bazaar.stock - @order_bazaar.quantity)
      @order_bazaar.save
    else
      render :new
    end
  end

  def show
    @bazaar = Bazaar.find(params[:id])
    @order = OrderBazaar.find(params[:bazaar_id])
    @contact = ContactBazaar.new
    @contacts = @order.contact_bazaars

    if user_signed_in? || company_signed_in?
      if current_company.nil? && current_user.id != @order.user.id
        redirect_to root_path
      elsif current_user.nil? && current_company.id != @order.bazaar.company.id
        redirect_to root_path
      end
    else
      redirect_to root_path
    end
  end

  def destroy
    @order = OrderBazaar.find(params[:bazaar_id])
    @order.update(active: "close")
    redirect_to bazaars_path
  end

  private

  def order_bazaar_params
    params.require(:order_bazaar).permit(:quantity).merge(
                    active: "active", user_id: current_user.id, company_id: @bazaar.company.id, bazaar_id: @bazaar.id)
  end

  def set_bazaar
    @bazaar = Bazaar.find(params[:bazaar_id])
  end
end
