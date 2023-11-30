class Category < ApplicationRecord
  belongs_to :user
  has_many :payments

  validates :name, presence: true, length: { maximum: 60 }
  validates :icon, presence: true

  def total_transaction_amount
    payments.sum(:amount)
  end
end
