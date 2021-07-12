class CompanysController < ApplicationController
  def show
    @company = Company.find(params[:id])
    @bazaars = @company.bazaars
    @order_bazaars = @company.order_bazaars
    @order_auctions = @company.order_auctions
  end

  def edit; end

  def update; end
end
