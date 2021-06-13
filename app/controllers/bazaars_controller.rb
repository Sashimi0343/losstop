class BazaarsController < ApplicationController
  before_action :set_bazaar, only: [:show, :edit, :update, :destroy]

  def index
    @bazaars = Bazaar.all
  end

  def new
    @bazaar = Bazaar.new
  end

  def create
    @bazaar = Bazaar.new(bazaar_params)
    if @bazaar.save
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def search
  end


  private

  def bazaar_params
    params.require(:bazaar).permit(:image, :title, :description, :price, :stock, :deadline,
                                   :category_id, :delivery_charge_id, :days_to_ship_id).merge(company_id: current_company.id)
  end

  def set_bazaar
    @bazaar = Bazaar.find(params[:id])
  end

end
