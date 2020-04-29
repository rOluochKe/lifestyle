class Notification < ApplicationRecord
  belongs_to :user
  scope :votes, -> { where('notice_type = vote') }
  scope :comments, -> { where('notice_type = comment') }
end
