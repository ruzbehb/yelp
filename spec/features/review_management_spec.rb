require 'spec_helper'

describe 'review management' do 

	before do
		@restaurant = FactoryGirl.create(:restaurant)
	end

	context 'logged out' do

		it 'requires user to sign in' do
			visit '/'
			click_on "Add Review"
			expect(page).to have_content "Sign in"
			expect(page).not_to have_field "Name"
		end

	end


	context 'logged in' do 

		before do
			login_as FactoryGirl.create(:user)
		end

		it 'shows average rating for a restaurant on the index page' do

		end

		it 'shows review for a restaurant on the index page' do
			visit new_restaurant_review_path(@restaurant)
			fill_in :review_rating, with: 2
			fill_in :review_body, with: "Reasonable prices but poor service"
			click_button :"Submit Review"
			visit '/'
			expect(page).to have_content "Reasonable prices but poor service"
		end
		
		it 'allows user to add a review' do
			visit '/'
			click_on "Add Review"
			expect(page).to have_content "Add Review for El Chico Bandito"
			expect(page).to have_button "Submit Review" 
		end

	end

end