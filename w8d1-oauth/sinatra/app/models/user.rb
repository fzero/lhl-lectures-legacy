class User < ActiveRecord::Base

  # From http://railscasts.com/episodes/360-facebook-authentication
  # This example will work with an auth hash from Facebook, but needs
  # to be adapted to work with other providers
  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end

end
