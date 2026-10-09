class Product < ApplicationRecord
    validates :name, presence: true
    has_many :orders

    validates :price_cents, numericality: {only_integer: true, greater_than: 0}
end
