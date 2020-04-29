class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :article
  has_many :votes, dependent: :destroy
end
