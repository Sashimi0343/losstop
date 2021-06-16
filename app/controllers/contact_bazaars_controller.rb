class ContactBazaarsController < ApplicationController

  def create
    contact_bazaar = ContactBazaar.create(contact_params)
  end

  private

  def contact_params
    if current_user == nil
      params.require(:contact_bazaar).permit(:message).merge(order_bazaar_id: params[:order_bazaar_id], company_id: current_company.id)
    else
      params.require(:contact_bazaar).permit(:message).merge(order_bazaar_id: params[:order_bazaar_id], user_id: current_user.id)
    end
  end
end