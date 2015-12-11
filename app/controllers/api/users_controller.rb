class Api::UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :log_in, :sign_up ]

  def log_in
    p = get_login_info
    if @current_user = User.find_by(email: p[:email])
      if @current_user.valid_password?(p[:password])
        sign_in(:user, @current_user)
        render template: 'api/users/object', status: 200 and return
      else
        @errors = { password: [ 'incorrect password' ] }
        render template: 'api/errors', status: 401 and return
      end
    else
      @errors = { email: [ 'email not found' ] }
      render template: 'api/errors', status: 401 and return
    end
  end

  def sign_up
    p = get_login_info
    if @current_user = User.find_by(email: p[:email])
      log_in
    else
      if p[:password] == p[:password_confirmation]
        @current_user = User.new
        @current_user.email = p[:email]
        @current_user.password = p[:password]
        if @current_user.save
          sign_in(:user, @current_user)
          render template: 'api/users/object', status: 201 and return
        else
          @errors = @current_user.errors.messages
          render template: 'api/errors', status: 400 and return
        end
      else
        @errors = { password: [ 'passwords do not match ' ] }
        render template: 'api/errors', status: 400 and return
      end
    end
  end

  private

  def get_login_info
    params.require(:user).permit(:email, :password, :password_confirmation).deep_symbolize_keys
  end

end
