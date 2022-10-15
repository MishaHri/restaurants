class RestaurantsController < ApplicationController

  def index
    @restaurants= Restaurant.all
  end

  def show
     @restaurant = Restaurant.find(params[:id])
  end

  def new
  @restaurant = Restaurant.new
  end

  def create
    restaurant = Restaurant.new(restaurant_params)
    restaurant.save
    redirect_to restaurant_path(restaurant)
  end

  def delete
    restaurant = Restaurant.find(params[:id])
    restaurant = restaurant.destroy
    redirect_to restaurants_path()
  end

  def delete_all
    restaurant_select_all = Restaurant.all
    restaurant_select_all_ids = restaurant_select_all.map {|x| x[:id]}
    restaurant_select_all_ids = restaurant_select_all.destroy(restaurant_select_all_ids)
    redirect_to restaurants_path()
  end


  private
  def restaurant_params
    params.require(:restaurant).permit(:name, :rating, :address)
  end

end
