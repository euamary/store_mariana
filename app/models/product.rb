class Product < ApplicationRecord
    validates :name, presence: {message: "cannot be blank!"}
end
