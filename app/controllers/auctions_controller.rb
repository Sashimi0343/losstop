class AuctionsController < ApplicationController
  before_action :set_auction, only: %i[show edit update destroy]
  before_action :authenticate_user!, only: %i[new create edit update destroy]
  before_action :check_user, only: %i[edit update destroy]
  before_action :search_auction, only: [:index, :search]

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
    @review = ReviewAuction.new
    @reviews = @auction.review_auctions.order('created_at DESC')
  end

  def edit; end

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

  def search
    @results_auction = @a.result
  end

  private

  def auction_params
    params.require(:auction).permit(:title, :description, :price, :stock, :deadline, :category_id,
                                    :delivery_charge_id).merge(user_id: current_user.id)
  end

  def set_auction
    @auction = Auction.find(params[:id])
  end

  def check_user
    redirect_to auctions_path if @auction.user.id != current_user.id
  end

  def search_auction
    @a = Auction.ransack(params[:q])
  end
end
