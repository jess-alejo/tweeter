class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar

  def avatar_url
    if avatar.attached?
    avatar.variant(resize: "100x100").processed.url
    else
    gravatar_url(email)
    end
  end
end
