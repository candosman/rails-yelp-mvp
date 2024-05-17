class RestaurantsController < ApplicationController
  #affiche tout les restos dans le index html. get/restaurants
  def index
    @restaurants = Restaurant.all
  end
  #affiche un resto avec son identfiant. get/restaurants/1
  def show


  end
  #affiche le nouveau resto. get/restaurant/new
  def new
    @restaurant = Restaurant.new

  end
  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to @restaurant, notice: "Restaurant was successfully created."
    else
      render :new, status: :unprocessable_entity
    end


  end

  private

  #permet la creation de restaurant avec ses attribues.
  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end
end
