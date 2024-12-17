class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable
  has_many :orders, as: :orderable
  has_one :cart, dependent: :destroy
end
