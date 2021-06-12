class BazaarsController < ApplicationController

  def index
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

end
