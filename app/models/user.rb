class User < ApplicationRecord
  has_many :articles
  has_many :comments
  has_many :votes, dependent: :destroy
  has_many :notifications, dependent: :destroy
  mount_uploader :image, ImageUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and
  # :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[facebook]
  validate :ImageUploader

  private

  # Validates the size of an uploaded picture.
  def picture_size
    errors.add(:image, 'should be less than 1MB') if image.size > 1.megabytes
end
end
