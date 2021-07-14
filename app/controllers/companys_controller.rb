class CompanysController < ApplicationController
  def show
    @company = Company.find(params[:id])
    @bazaars = @company.bazaars
    @order_bazaars = @company.order_bazaars
    @order_auctions = @company.order_auctions
  end

  def edit
    @company = Company.find(params[:id])
  end

  def update
    @company = Company.find(params[:id])
  end
end
