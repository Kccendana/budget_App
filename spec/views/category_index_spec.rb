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
    cat1 = Category.create(name: 'house', icon: 'house.png', user: User.first)
    cat2 = Category.create(name: 'bills', icon: 'bills.png', user: User.first)

    visit categories_path
    puts page.html

    expect(page).to have_content(cat1.name)
    expect(page).to have_content(cat2.name)

    expect(page).to have_css('img')
    expect(page).to have_css("[alt='#{cat1.name}']")
    expect(page).to have_css("[alt='#{cat2.name}']")

    expect(page).to have_selector(:link_or_button, 'Add category')
  end
end
