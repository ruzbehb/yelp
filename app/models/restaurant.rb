class Restaurant < ActiveRecord::Base

	belongs_to :user

	has_many :reviews

	def avg_rating
		sum_of_ratings = 0
		count = 0
		restaurant.reviews.each do |review|
			sum_of_ratings += review.rating
			count += 1
		end
		sum_of_ratings/count
	end

	def full_stars

	end

	def half_stars

	end

end
