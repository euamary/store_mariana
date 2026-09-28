class Product < ApplicationRecord
    has_rich_text :description
    has_one_attached :featured_image
    validates :name, presence: {message: "cannot be blank!"}
end
