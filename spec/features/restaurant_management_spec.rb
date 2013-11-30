require 'spec_helper'

describe 'restaurant management' do
	
	context 'lists restaurants correctly' do
		it 'lists restaurants' do
			FactoryGirl.create(:restaurant)
			visit '/'
			expect(page).to have_content "Best Mexican in town"
		end
	end

	context 'add a restaurant' do
		it 'add a new restaurant' do
			visit new_restaurant_path
			fill_in 'restaurant_name', with: 'Pizzeria'
			fill_in 'restaurant_body', with: 'Best Italian Pizzas'
			click_button 'Add Restaurant'
			visit '/'
			expect(page).to have_content "Best Italian Pizzas"
		end
	end

end