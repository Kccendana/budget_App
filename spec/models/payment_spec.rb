require 'rails_helper'

RSpec.describe Payment, type: :model do
  let(:user) { User.create(name: 'John Can', email: 'john@bar.com', password: '123456') }
  let(:category) { Category.create(name: 'Food', icon: 'food.png', user:) }

  it 'is associated with a category' do
    payment = Payment.new(amount: 25, category:)
    expect(payment.category).to eq(category)
  end

  it 'is associated with an author (User)' do
    payment = Payment.new(amount: 30.00, category:, user:)
    expect(payment.user).to eq(user)
  end

  it 'requires a category' do
    payment = Payment.new(amount: 25, user:)
    expect(payment).to_not be_valid
  end

  it 'requires an author (User)' do
    payment = Payment.new(amount: 30.00, category:)
    expect(payment).to_not be_valid
  end

  it 'can save a valid expense' do
    payment = Payment.new(name: 'Pizza', amount: 25, category:, user:)
    expect(payment).to be_valid
  end
end
