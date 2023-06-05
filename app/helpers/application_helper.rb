module ApplicationHelper
  def gravatar_url(email, size = 32)
    email_hash = Digest::MD5.hexdigest(email.downcase.strip)
    "https://www.gravatar.com/avatar/#{email_hash}?s=#{size}&d=identicon"
  end
end