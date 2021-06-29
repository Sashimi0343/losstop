class CompanysController < ApplicationController
  def show
    @company = Company.find(params[:id])
    @bazaars = @company.bazaars
    @orders = @company.order_bazaars
  end

  def edit; end

  def update; end
end
