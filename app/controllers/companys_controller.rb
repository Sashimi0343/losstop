class CompanysController < ApplicationController

  def show
    @company = Company.find(params[:id])
    @bazaars = @company.bazaars
  end

  def edit

  end

  def update

  end
end
