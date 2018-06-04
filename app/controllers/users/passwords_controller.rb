class Users::PasswordsController < Devise::PasswordsController
  def create
  	if User.find_by(email: params["user"]["email"]).provider.present?
      redirect_to new_user_password_path, notice: 'GoogleアカウントもしくはGithubアカウントで登録している場合はパスワードは使用されていません'
    else
      super
    end
  end
end