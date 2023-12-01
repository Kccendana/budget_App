require 'rails_helper'

RSpec.feature 'Payment', type: :feature do
  let(:user) { User.create(name: 'user test', email: 'user@example.com', password: 'password') }

  before(:each) do
    visit new_user_session_path
    fill_in 'name@example.com', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
    sleep 1
    visit categories_path
    click_link 'Add category'
  end
  scenario 'User adds payment to category' do
    category = Category.create(name: 'house', icon: 'house.png', user: User.first)

    visit category_payments_path(category)
    expect(page).to have_content('Transactions')
    click_link 'New payment'
    sleep 1
    expect(page).to have_content('Payments')
    fill_in 'payment[amount]', with: '100', visible: :all
    fill_in 'payment[name]', with: 'rent', visible: :all
    click_button 'Add'
    expect(page).to have_content('rent')
    expect(page).to have_content('$ 100')
  end
end
