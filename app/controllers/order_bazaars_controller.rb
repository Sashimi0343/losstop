class OrderBazaarsController < ApplicationController
  before_action :set_bazaar, only: %i[new create]
  before_action :authenticate_user!, only: %i[new create]

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

  private

  def order_bazaar_params
    params.require(:order_bazaar).permit(:quantity).merge(user_id: current_user.id, company_id: @bazaar.company.id, bazaar_id: @bazaar.id)
  end

  def set_bazaar
    @bazaar = Bazaar.find(params[:bazaar_id])
  end
end
