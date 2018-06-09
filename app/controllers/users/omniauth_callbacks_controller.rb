class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google
    @user = User.find_for_google(request.env['omniauth.auth'])
    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication
      set_flash_message(:notice, :success, kind: "google") if is_navigational_format?
    else
      session['devise.google_data'] = request.env['omniauth.auth'].except("extra")
      if User.find_by(email: session['devise.google_data']['info']['email']).present?
        redirect_to new_user_session_path, notice: '同じアドレスですでに登録されているアカウントがあります'
      else
        redirect_to new_user_session_path
      end
    end
  end

  def github
    @user = User.find_for_github_oauth(request.env["omniauth.auth"], current_user)
    if @user.persisted?
      set_flash_message(:notice, :success, kind: "Github") if is_navigational_format?
      sign_in_and_redirect @user, event: :authentication
    else
      session["devise.github_data"] = request.env["omniauth.auth"].except("extra")
      if User.find_by(email: session["devise.github_data"]['info']['email']).present?
        redirect_to new_user_session_path, notice: '同じアドレスですでに登録されているアカウントがあります'
      else
        redirect_to new_user_session_path
      end
    end
  end

  # def facebook
  #   @user = User.find_for_facebook_oauth(request.env["omniauth.auth"], current_user)
  #   if @user.persisted?
  #     set_flash_message(:notice, :success, kind: "Facebook") if is_navigational_format?
  #     sign_in_and_redirect @user, event: :authentication
  #   else
  #     session["devise.facebook_data"] = request.env["omniauth.auth"]
  #     redirect_to new_user_session_path
  #   end
  # end

  # def twitter
  #   @user = User.find_for_twitter_oauth(request.env["omniauth.auth"], current_user)
  #   if @user.persisted?
  #     set_flash_message(:notice, :success, kind: "Twitter") if is_navigational_format?
  #     sign_in_and_redirect @user, event: :authentication
  #   else
  #     session["devise.twitter_data"] = request.env["omniauth.auth"].except("extra")
  #     redirect_to new_user_session_path
  #   end
  # end
end