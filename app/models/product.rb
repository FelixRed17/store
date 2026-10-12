class Product < ApplicationRecord
    validates :name, presence: true
    has_many :orders, dependent: :restrict_with_error
    has_one_attached :image

    validates :price_cents, numericality: {only_integer: true, greater_than: 0}
end
