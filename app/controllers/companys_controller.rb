class CompanysController < ApplicationController
  before_action :set_company, only: %i[show edit update]
  before_action :set_endlist, only: %i[end_list]
  before_action :set_information, only: %i[show endlist]

  def show
  end

  def end_list
  end

  def edit
  end

  def update
  end


  private
  def set_company
    @company = Company.find(params[:id])
  end

  def set_endlist
    @company = Company.find(current_company.id)
  end

  def set_information
    @bazaars = @company.bazaars
    @order_bazaars = @company.order_bazaars
    @order_auctions = @company.order_auctions
  end
end
