class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar

  def avatar_url
    if avatar.attached?
      # avatar.variant(resize: "100x100").processed.url
      Rails.application.routes.url_helpers.rails_blob_path(avatar, only_path: true)
    else
      gravatar_url(email)
    end
  end

  def gravatar_url(email, size = 32)
    email_hash = Digest::MD5.hexdigest(email.downcase.strip)
    "https://www.gravatar.com/avatar/#{email_hash}?s=#{size}&d=identicon"
  end
end
