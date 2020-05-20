class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :article
  has_many :votes, dependent: :destroy

  validates :content, length: { in: 3..200 }, allow_blank: false
end
