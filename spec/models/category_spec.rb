require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:user) { User.create(name: 'Katherine Cendana', email: 'kathy@test.com', password: 'testing') }

  it 'is valid with a name and user' do
    category = Category.new(name: 'Food', icon: 'cat.png', user:)
    expect(category).to be_valid
  end

  it 'is not valid without a user' do
    category = Category.new(name: 'Transportation')
    expect(category).not_to be_valid
  end

  it 'does allow the same category name for different users' do
    another_user = User.create(name: 'Juliette Brndden', email: 'juliette@bar.com', password: '654321')
    Category.create(name: 'Food', icon: 'food.png', user:)
    category2 = Category.new(name: 'Food', icon: 'food.png', user: another_user)
    expect(category2).to be_valid
  end
end
