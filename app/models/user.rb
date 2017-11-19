class User < ApplicationRecord

    has_many :tweets, dependent: :destroy
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook]

           def self.from_omniauth(auth)
           where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
             user.email = auth.info.email
             user.password = Devise.friendly_token[0,20]
             user.name = auth.info.name   # assuming the user model has a name
            #  user.image = auth.info.image # assuming the user model has an image
             # If you are using confirmable and the provider(s) you use validate emails,
             # uncomment the line below to skip the confirmation emails.
             # user.skip_confirmation!
           end
         end

    has_many :active_relationships, class_name: 'Following', foreign_key: :follower_id, dependent: :destroy

    has_many :followeds, through: :active_relationships

    has_many :passive_relationships, class_name: 'Following', foreign_key: :followed_id, dependent: :destroy

    has_many :followers, through: :passive_relationships

    has_attached_file :avatar, default_url: "nopicture.png"
    validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/


  validates :name, presence: true

  def country_name
    country = ISO3166::Country[country_code]
    country.translations[I18n.locale.to_s] || country.name
  end

    # Follows a user.
  def follow(other_user)
    followeds << other_user
  end

  # Unfollows a user.
  def unfollow(other_user)
    followeds.delete(other_user)
  end

  # Returns true if the current user is following the other user.
  def following?(other_user)
    followeds.include?(other_user)
  end


end
