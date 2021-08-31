class OrderAuctionsController < ApplicationController
  before_action :set_auction, only: %i[new create destroy]
  before_action :authenticate_company!, only: %i[new create]

  def new
    @order_auction = OrderAuction.new
  end

  def create
    @order_auction = OrderAuction.new(order_auction_params)
    if @order_auction.save
    else
      render :new
    end
  end

  def show
    @auction = Auction.find(params[:id])
    @order = OrderAuction.find(params[:auction_id])
    @contact = ContactAuction.new
    @contacts = @order.contact_auctions.order('created_at DESC')

    if user_signed_in? || company_signed_in?
      if current_user.nil? && current_company.id != @order.company.id
        redirect_to root_path
      elsif current_company.nil? && current_user.id != @order.auction.user.id
        redirect_to root_path
      end
    else
      redirect_to root_path
    end
  end

  def destroy
    @order = OrderAuction.find(params[:auction_id])
    @order.update(active: "close")
    redirect_to auctions_path
  end

  private

  def order_auction_params
    params.require(:order_auction).permit(:title, :description, :price, :image).merge(
                    active: "active", company_id: current_company.id, user_id: @auction.user.id, auction_id: @auction.id)
  end

  def set_auction
    @auction = Auction.find(params[:auction_id])
  end
end
