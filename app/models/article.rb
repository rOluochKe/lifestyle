class Article < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :votes, dependent: :destroy
  validates :content, length: { in: 3..800 }, allow_blank: false
end
