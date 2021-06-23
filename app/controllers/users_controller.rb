class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @auctions = @user.auctions
  end

  def edit

  end

  def update

  end
end
