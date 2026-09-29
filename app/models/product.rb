class Product < ApplicationRecord
    has_many :subscribers, dependent: :destroy
    has_rich_text :description
    has_one_attached :featured_image
    validates :name, presence: {message: "cannot be blank!"}
    validates :inventory_count, numericality: {greater_than_or_equal_to: 0}
end