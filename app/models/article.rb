class Article < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :votes, dependent: :destroy

  validates :title, length: { in: 3..100 }, allow_blank: false
  validates :content, length: { in: 3..1000 }, allow_blank: false
  validates :image, presence: true
  validates :category_id, presence: true
end
