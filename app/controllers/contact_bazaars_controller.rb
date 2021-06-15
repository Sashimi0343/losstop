class ContactBazaarsController < ApplicationController

  def create
    message = ContactBazaar.new(message_params)
  end

  private

  def message_params
    params.require(:contact_bazaar).permit(:message).merge(order_bazaar_id: params[:order_bazaar_id],
                                                          user_id: current_user.id, company_id: current_company.id)
  end

end