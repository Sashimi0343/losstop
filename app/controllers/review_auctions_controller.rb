class ReviewAuctionsController < ApplicationController
  before_action :check_login, only: %i[create]

  def create
    review_auction = ReviewAuction.create(review_params)
    ActionCable.server.broadcast 'review_auction_channel', content: review_auction
  end

  private

  def review_params
    if current_user.nil?
      params.require(:review_auction).permit(:comment).merge(name: current_company.name, auction_id: params[:auction_id], company_id: current_company.id)
    else
      params.require(:review_auction).permit(:comment).merge(name: current_user.name, auction_id: params[:auction_id], user_id: current_user.id)
    end
  end

  def check_login
    unless user_signed_in? || company_signed_in?
      redirect_to root_path
    end
  end
end
