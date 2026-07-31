class Book < ApplicationRecord
    validates :title, :genre, :year_published, presence: true
    validates :isbn, uniqueness: true
    validates :page_count, numericality: { only_integer: true, greater_than: 0 }
    validates :
end
