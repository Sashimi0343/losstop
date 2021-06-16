class ReviewBazaarsController < ApplicationController

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

end
