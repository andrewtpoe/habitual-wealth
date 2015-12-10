class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :sign_up, :create ]

  def sign_up
    p = get_login_info
    if current_user || @user = User.find_by(email: p[:email])
      @user = current_user unless @user
      sign_in(:user, @user)
      redirect_to app_path
    else
      create()
    end
  end

  def create
    p = get_login_info
    if p[:email] && p[:password] && p[:email].include?('@') && p[:password].length >= 8
      @user = User.new
      @user.email = p[:email]
      @user.password = p[:password]
      if @user.save
        binding.pry
        sign_in(:user, @user)
      end
    else
      redirect_to root_path
    end
  end

  private

  def get_login_info
    params.permit(:email, :password)
  end

end
