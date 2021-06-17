class ContactBazaarsController < ApplicationController
  before_action :check_login, only: %i[create]

  def create
    contact_bazaar = ContactBazaar.new(contact_params)

    if current_company == nil && (current_user.id != contact_bazaar.user.id)
      redirect_to root_path
    elsif current_user == nil && (current_company.id != contact_bazaar.company.id)
      redirect_to root_path
    else
      contact_bazaar.save
    end
  end

  private

  def contact_params
    if current_user == nil
      params.require(:contact_bazaar).permit(:message).merge(order_bazaar_id: params[:order_bazaar_id], company_id: current_company.id)
    else
      params.require(:contact_bazaar).permit(:message).merge(order_bazaar_id: params[:order_bazaar_id], user_id: current_user.id)
    end
  end

  def check_login
    unless user_signed_in? || company_signed_in?
      redirect_to root_path
    end
  end
end