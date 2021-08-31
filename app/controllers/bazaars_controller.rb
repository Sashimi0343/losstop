class BazaarsController < ApplicationController
  before_action :set_bazaar, only: %i[show edit update destroy]
  before_action :authenticate_company!, only: %i[new create edit update destroy]
  before_action :check_company, only: %i[edit update destroy]
  before_action :deadline_or_stock, only: [:edit, :update]
  before_action :search_bazaar, only: [:index, :search]


  def index
    @bazaars = Bazaar.order('created_at DESC')
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
    @order = @bazaar.order_bazaars
    @review = ReviewBazaar.new
    @reviews = @bazaar.review_bazaars.order('created_at DESC')
  end


  def edit; end


  def update
    if @bazaar.update(bazaar_params)
      redirect_to bazaar_path(params[:id])
    else
      render :edit
    end
  end


  def destroy
    @bazaar.update(active: "close")
    redirect_to bazaars_path
  end


  def search
    @results_bazaar = @b.result
  end


  private

  def bazaar_params
    params.require(:bazaar).permit(:image, :title, :description, :price, :stock, :deadline,
                                    :category_id, :delivery_charge_id).merge(company_id: current_company.id, active: "active")
  end

  def set_bazaar
    @bazaar = Bazaar.find(params[:id])
  end

  def check_company
    redirect_to bazaar_path if @bazaar.company.id != current_company.id
  end

  def search_bazaar
    @b = Bazaar.ransack(params[:q])
  end

  def deadline_or_stock
    if (@bazaar.deadline < Time.now) || (@bazaar.stock == 0)
      redirect_to root_path
    end
  end
end
