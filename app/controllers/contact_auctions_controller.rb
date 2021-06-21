class ContactAuctionsController < ApplicationController
  before_action :check_login, only: %i[create]

  def create
    contact_auction = ContactAuction.new(contact_params)

    if current_company == nil && (current_user.id != contact_auction.user.id)
      redirect_to root_path
    elsif current_user == nil && (current_company.id != contact_auction.company.id)
      redirect_to root_path
    else
      contact_auction.save
      ActionCable.server.broadcast 'contact_auction_channel', content: contact_auction
    end
  end

  private

  def contact_params
    if current_user == nil
      params.require(:contact_auction).permit(:message).merge(name: current_company.name, order_auction_id: params[:order_auction_id], company_id: current_company.id)
    else
      params.require(:contact_auction).permit(:message).merge(name: current_user.nickname, order_auction_id: params[:order_auction_id], user_id: current_user.id)
    end
  end

  def check_login
    unless user_signed_in? || company_signed_in?
      redirect_to root_path
    end
  end
end
