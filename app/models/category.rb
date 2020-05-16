class Category < ApplicationRecord
  validates :category, presence: true
  validates :priority, presence: true
end
