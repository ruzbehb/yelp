require 'spec_helper'

describe 'restaurant management' do
	
	context 'lists restaurants correctly' do
		it 'lists restaurants' do
			FactoryGirl.create(:restaurant)
			visit '/'
			expect(page).to have_content "Best Mexican in town"
		end
	end

	context 'logged in' do

		before do
			login_as FactoryGirl.create(:user)
		end

		it 'adds a new restaurant' do
			visit new_restaurant_path
			fill_in 'restaurant_name', with: 'Pizzeria'
			fill_in 'restaurant_body', with: 'Best Italian Pizzas'
			click_button 'Add Restaurant'
			visit '/'
			expect(page).to have_content "Best Italian Pizzas"
		end
	end

	context 'logged out' do
		
		it 'send to sign_in page when trying to loging' do
			visit new_restaurant_path
			expect(page).to have_content "Sign in"
			expect(page).not_to have_field 'Name'
		end
	end	

end