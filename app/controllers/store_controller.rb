class StoreController < ApplicationController
  before_action :increment_visits_without_adding_to_cart, only: [:index]

  def index
    @products = Product.order(:title)
  end

  private
    def increment_visits_without_adding_to_cart
      session[:store_visits_without_adding_to_cart] ||= 0
      session[:store_visits_without_adding_to_cart] += 1
    end
end
