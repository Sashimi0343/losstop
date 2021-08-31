class ContactAuctionsController < ApplicationController
  before_action :check_login, only: %i[create]

  def create
    auction = OrderAuction.find(params[:order_auction_id])
    contact_auction = ContactAuction.new(contact_params)

    if current_company.nil? && (current_user.id != contact_auction.user.id)
      redirect_to root_path
    elsif current_user.nil? && (current_company.id != contact_auction.company.id)
      redirect_to root_path
    else
      contact_auction.save
      redirect_back(fallback_location: auction_order_auction_path(auction.auction.id, auction.id))
    end
  end

  private

  def contact_params
    if current_user.nil?
      params.require(:contact_auction).permit(:message).merge(name: current_company.name,
                                                              order_auction_id: params[:order_auction_id], company_id: current_company.id)
    else
      params.require(:contact_auction).permit(:message).merge(name: current_user.name,
                                                              order_auction_id: params[:order_auction_id], user_id: current_user.id)
    end
  end

  def check_login
    redirect_to root_path unless user_signed_in? || company_signed_in?
  end
end
