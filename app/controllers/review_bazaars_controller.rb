class ReviewBazaarsController < ApplicationController
  before_action :check_login, only: %i[create]

  def create
    review_bazaar = ReviewBazaar.create(review_params)
    ActionCable.server.broadcast 'review_bazaar_channel', content: review_bazaar
  end

  private

  def review_params
    if current_user.nil?
      params.require(:review_bazaar).permit(:comment).merge(name: current_company.name, bazaar_id: params[:bazaar_id],
                                                            company_id: current_company.id)
    else
      params.require(:review_bazaar).permit(:comment).merge(name: current_user.name, bazaar_id: params[:bazaar_id],
                                                            user_id: current_user.id)
    end
  end

  def check_login
    redirect_to root_path unless user_signed_in? || company_signed_in?
  end
end
