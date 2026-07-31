class Author < ApplicationRecord
    validates :name, presence: true
    validates :age, numericality: { only_integer: true, greater_than: 0 }
end
