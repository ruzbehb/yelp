class ReviewsController < ApplicationController

	before_action :authenticate_user!

	def new
		@restaurant = Restaurant.find(params[:restaurant_id])
		@review = @restaurant.reviews.new
	end

	def create
		restaurant = Restaurant.find(params[:restaurant_id])
		review = restaurant.reviews.build(params[:review].permit(:rating, :body))

		if review.save
			flash[:notice] = 'Thanks for your review'
			redirect_to '/'
		else
			flash[:notice] = 'Apologies, the review was not saved'
			render 'new'
		end

	end

end
