class RestaurantsController < ApplicationController

	before_action :authenticate_user!, except: [:index, :show]

	def index
		@restaurants = Restaurant.all

	end

	def new
		@restaurant = Restaurant.new
	end

	def create
		@restaurant = Restaurant.create(params[:restaurant].permit(:name, :body, :user_id))
		flash[:notice] = "Restaurant added"
		redirect_to restaurants_path		
	end

end
