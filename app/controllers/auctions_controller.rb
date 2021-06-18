class AuctionsController < ApplicationController
  before_action :set_auction, only: %i[show edit update destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :check_user, only: %i[edit update destroy]


  def index
    @auctions = Auction.order('created_at DESC')
  end

  def new
    @auction = Auction.new
  end

  def create
    @auction = Auction.new(auction_params)
    if @auction.save
    else
      render :new
    end
  end

  def show
    @order_auction = OrderAuction.all
    #@review = ReviewAuction.new
    #@reviews = @auction.review_auctions.order('created_at DESC')
  end

  def edit
  end

  def update
    if @auction.update(auction_params)
      redirect_to auction_path(params[:id])
    else
      render :edit
    end
  end

  def destroy
    redirect_to auctions_path if @auction.destroy
  end

  def search; end

  private

  def auction_params
    params.require(:auction).permit(:title, :description, :price, :stock, :category_id,
                                    :delivery_charge_id, :days_to_ship_id).merge(user_id: current_user.id)
  end

  def set_auction
    @auction = Auction.find(params[:id])
  end

  def check_user
    if @auction.user.id != current_user.id
      redirect_to auctions_path
    end
  end
end
