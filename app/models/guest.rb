class Guest < ApplicationRecord
  has_many :orders, as: :orderable
  has_one :cart

  def email
    "Guest - Not logged in"
  end
end
