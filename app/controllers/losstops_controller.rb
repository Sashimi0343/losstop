class LosstopsController < ApplicationController
  before_action :search_bazaar, only: [:index, :search]

  def index
    @bazaars = Bazaar.all
  end

  def search
    @results = @b.result
  end

  private

  def search_bazaar
    @b = Bazaar.ransack(params[:q])
  end
end
