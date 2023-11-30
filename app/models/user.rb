class User < ApplicationRecord
  has_many :categories
  has_many :payments

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true, length: { minimum: 3, maximum: 50 }
  validate :fullname

  def fullname
    return unless name.split.size != 2

    errors.add(:name, 'must contain two names separated by a space')
  end
end
