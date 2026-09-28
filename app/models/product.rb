class Product < ApplicationRecord
    has_rich_text :description
    validates :name, presence: {message: "cannot be blank!"}
end
