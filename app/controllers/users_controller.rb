class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update]
  before_action :set_endlist, only: %i[end_list]
  before_action :set_information, only: %i[show end_list]

  def show
  end

  def end_list
  end

  def edit
  end

  def update
  end


  private
  def set_user
    @user = User.find(params[:id])
  end

  def set_endlist
    @user = User.find(current_user.id)
  end

  def set_information
    @auctions = @user.auctions
    @order_bazaars = @user.order_bazaars
    @order_auctions = @user.order_auctions
  end
end
