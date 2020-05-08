class Article < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :votes, dependent: :destroy
  validates :title, length: { in: 3..10 }, allow_blank: false
  validates :content, length: { in: 3..1000 }, allow_blank: false
end
