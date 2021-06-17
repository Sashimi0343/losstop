class ReviewBazaarsController < ApplicationController
  before_action :check_login, only: %i[create]

  def create
    review_bazaar = ReviewBazaar.create(review_params)
  end

  private

  def review_params
    if current_user == nil
      params.require(:review_bazaar).permit(:comment).merge(bazaar_id: params[:bazaar_id], company_id: current_company.id)
    else
      params.require(:review_bazaar).permit(:comment).merge(bazaar_id: params[:bazaar_id], user_id: current_user.id)
    end
  end

  def check_login
    unless user_signed_in? || company_signed_in?
      redirect_to root_path
    end
  end

end
