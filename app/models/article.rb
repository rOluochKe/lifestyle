class Article < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :votess, dependent: :destroy
end
