class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :omniauthable, :omniauth_providers => [:twitter]
  
  def self.find_for_twitter_oauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.uid + "@twitter.com" #dummy
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name
      user.image = auth.info.image

      user.save!
    end
  end
end
