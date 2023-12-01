require 'rails_helper'

RSpec.feature 'Category', type: :feature do
  let(:user) { User.create(name: 'user test', email: 'user@example.com', password: 'password') }

  before(:each) do
    visit new_user_session_path
    fill_in 'name@example.com', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
    sleep 1
  end
  scenario 'User views the list of categories' do
    # Create some recipes for testing (you can adjust the attributes)
    category = Category.create(name: 'house', icon: 'house.png', user: User.first)

    category.payments.create(
      name: 'rent',
      amount: 100,
      user: User.first
    )

    visit category_payments_path(category)
    puts page.html

    # Verify that the recipe name, description, and other elements are displayed correctly
    expect(page).to have_content('rent') # Update to match the view
    expect(page).to have_content('100')

    # Verify that the "Modify" and "Remove" buttons are present for the ingredient
    expect(page).to have_selector(:link_or_button, 'New payment')
  end
end
