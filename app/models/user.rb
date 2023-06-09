class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar

  has_many :tweets

  # after_commit :log_user_creation, on: :create
  after_create_commit :log_user_creation


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

  def full_name
    [
      first_name,
      last_name
    ].compact_blank.join(" ")
  end

  private

    def log_user_creation
      message = ">>>> New User Created: #{email} at #{created_at.to_formatted_s(:long)}"
      log_file = Rails.root.join("log", "user_creation.log")
      logger = ActiveSupport::Logger.new(log_file)
      logger.info(message)
    end
end
