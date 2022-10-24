class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all
  end

 def show
  @restaurant = Restaurant.find(params[:id])
end

  def new
      @restaurant = Restaurant.new
  end


  def top
    @restaurants = Restaurant.where(rating: 5)
  end

  def chef
    @restaurant =Restaurant.find(params[:id])
    @chef_name = @restaurant.chef_name
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.save
    redirect_to restaurant_path(@restaurant)
  end

  def edit
   @restaurant = Restaurant.find(params[:id])
  end




  def update
    @restaurant = Restaurant.find(params[:id])
    @restaurant.update(restaurant_params)
    redirect_to restaurants_path()
  end

  def destroy
    restaurant = Restaurant.find(params[:id])
    restaurant = restaurant.destroy
    redirect_to restaurants_path, status: :see_other
  end

  def delete_all
    restaurant_select_all = Restaurant.all
    restaurant_select_all_ids = restaurant_select_all.map {|x| x[:id]}
    restaurant_select_all_ids = restaurant_select_all.destroy(restaurant_select_all_ids)
    redirect_to restaurants_path()
  end


  private


  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :rating)
  end

end
