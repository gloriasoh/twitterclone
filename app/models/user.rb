class User < ApplicationRecord

    has_many :tweets, dependent: :destroy
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :trackable, :validatable

    has_many :active_relationships, class_name: 'Following', foreign_key: :follower_id
    has_many :followeds, through: :active_relationships

    has_many :passive_relationships, class_name: 'Following', foreign_key: :followed_id
    has_many :followers, through: :passive_relationships

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
