class Order < ApplicationRecord
  belongs_to :user
  belongs_to :product

  validates :quantity, :unit_price_cents,
                        numericality: {
                          only_integer: true,
                          greater_than: 0
                        }

  validates :status, inclusion: { in: ["pending", "fulfilled"] }
end
