class User < ApplicationRecord
  has_many :articles
  has_many :comments
  has_many :votes, dependent: :destroy
  has_many :notifications, dependent: :destroy
  mount_uploader :image, ImageUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and
  # :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[facebook]

  validates :name, length: { in: 3..40 }, presence: true
  validate :picture_size

  def full_name
    name.to_s
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.name = auth.info.name # assuming the user model has a name
      user.image = auth.info.image # assuming the user model has an image
      # If you are using confirmable and the provider(s) you use validate emails,
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if (data = session['devise.facebook_data'] && session['devise.facebook_data']['extra']['raw_info'])
        user.email = data['email'] if user.email.blank?
      end
    end
  end

  private

  # Validates the size of an uploaded picture.
  def picture_size
    errors.add(:image, 'should be less than 1MB') if image.size > 1.megabytes
  end
end
