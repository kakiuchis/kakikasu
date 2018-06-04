class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable,
         :omniauthable, omniauth_providers: %i(google github)

  enum role: { admin: 1, member: 2 }

  def self.create_unique_string
    SecureRandom.uuid
  end

  def update_with_password(params, *options)
    if provider.blank?
      super
    else
      params.delete :current_password
      update_without_password(params, *options)
    end
  end

  def self.find_for_google(auth)
    user = User.find_by(email: auth.info.email, provider: auth.provider)
    unless user
      user = User.new(
        email: auth.info.email, 
      	provider: auth.provider, 
      	uid:      auth.uid, 
      	password: Devise.friendly_token[0, 20],
      	)
    end
    user.skip_confirmation!
    user.save
    user
  end

  def self.find_for_github_oauth(auth, signed_in_resource = nil)
    user = User.find_by(provider: auth.provider, uid: auth.uid)
    unless user
      user = User.new(
        provider: auth.provider,
        uid: auth.uid,
        email: auth.info.email,
        password: Devise.friendly_token[0, 20],
      )
    end
    user.skip_confirmation!
    user.save
    user
  end

  # def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
  #   user = User.find_by(provider: auth.provider, uid: auth.uid)
  #   unless user
  #     user = User.new(
  #       provider: auth.provider, 
  #       uid: auth.uid,
  #       email: "#{auth.uid}-#{auth.provider}@example.com",
  #       password: Devise.friendly_token[0, 20],
  #     )
  #   end
  #   user.skip_confirmation!
  #   user.save
  #   user
  # end

  # def self.find_for_twitter_oauth(auth, signed_in_resource = nil)
  #   user = User.find_by(provider: auth.provider, uid: auth.uid)
  #   unless user
  #     user = User.new(
  #       provider: auth.provider,
  #       uid: auth.uid,
  #       email: "#{auth.uid}-#{auth.provider}@example.com",
  #       password: Devise.friendly_token[0, 20],
  #     )
  #   end
  #   user.skip_confirmation!
  #   user.save
  #   user
  # end
end
