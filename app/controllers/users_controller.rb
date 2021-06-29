class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @auctions = @user.auctions
    @orders = @user.order_auctions
  end

  def edit; end

  def update; end
end
