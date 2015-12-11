require 'test_helper'

class Api::UsersControllerTest < ActionController::TestCase

  def setup
    @current_user = users(:one)
  end

  test 'POST #log_in will sign in the correct user when given valid params' do
    params = {
      user: {
        email: @current_user.email,
        password: 'password'
      },
      format: :json
    }
    post :log_in, params
    assert_response 200
    r = JSON.parse(@response.body).deep_symbolize_keys
    assert valid_user_object(r)
  end

  test 'POST #log_in will not sign in a user without valid password' do
    params = {
      user: {
        email: 'test_one@gmail.com',
        password: 'incorrect'
      },
      format: :json
    }
    post :log_in, params
    assert_response 401
    r = JSON.parse(@response.body).deep_symbolize_keys
    assert r[:errors].include?(:password)
  end

  test 'POST #log_in will return an error if no user is found with matching email' do
    params = {
      user: {
        email: 'no_such_email@gmail.com',
        password: 'password'
      },
      format: :json
    }
    post :log_in, params
    assert_response 401
    r = JSON.parse(@response.body).deep_symbolize_keys
    assert r[:errors].include?(:email)
  end

  test 'POST #sign_up will register a new user with a valid email and matching passwords' do
    number_of_users = User.all.length
    params = {
      user: {
        email: 'test_email@mydomain.com',
        password: 'password',
        password_confirmation: 'password'
      },
      format: :json
    }
    post :sign_up, params
    assert_response 201
    assert User.all.length == number_of_users + 1
    r = JSON.parse(@response.body).deep_symbolize_keys
    assert valid_user_object(r)
  end

  test 'POST #sign_up will not register a new user if email does not include one and only one "@" and at least one "."' do
    number_of_users = User.all.length
    p1 = {
      user: {
        email: 'test_emailmydomain.com',
        password: 'password',
        password_confirmation: 'password'
      },
      format: :json
    }
    p2 = {
      user: {
        email: 'test@email@mydomain.com',
        password: 'password',
        password_confirmation: 'password'
      },
      format: :json
    }
    p3 = {
      user: {
        email: 'test_email@mydomaincom',
        password: 'password',
        password_confirmation: 'password'
      },
      format: :json
    }
    p4 = {
      user: {
        email: '',
        password: 'password',
        password_confirmation: 'password'
      },
      format: :json
    }
    params = [p1, p2, p3, p4]
    params.each_with_index do |p, index|
      post :sign_up, p
      assert_response 400
      assert User.all.length == number_of_users
      r = JSON.parse(@response.body).deep_symbolize_keys
      assert r[:errors].include?(:email)
    end
  end

  test 'POST #sign_up will not register a new user with same email as an existing user' do
    number_of_users = User.all.length
    params = {
      user: {
        email: @current_user.email,
        password: 'password',
        password_confirmation: 'password'
      },
      format: :json
    }
    refute @current_user.current_sign_in_at
    post :sign_up, params
    assert_response 200
    assert User.all.length == number_of_users
    @current_user.reload
    assert @current_user.current_sign_in_at
    r = JSON.parse(@response.body).deep_symbolize_keys
    assert valid_user_object(r)
  end

  test 'POST #create will not register a new user if password is not at least 8 characters' do
    number_of_users = User.all.length
    params = {
      user: {
        email: 'test_email@mydomain.com',
        password: 'not8',
        password_confirmation: 'not8'
      },
      format: :json
    }
    post :sign_up, params
    assert_response 400
    assert User.all.length == number_of_users
    r = JSON.parse(@response.body).deep_symbolize_keys
    assert r[:errors].include?(:password)
  end

  test 'POST #sign_up will not register a new user if password and confirmation password do not match' do
    number_of_users = User.all.length
    params = {
      user: {
        email: 'test_email@mydomain.com',
        password: 'password',
        password_confirmation: 'notmatch'
      },
      format: :json
    }
    post :sign_up, params
    assert_response 400
    assert User.all.length == number_of_users
    r = JSON.parse(@response.body).deep_symbolize_keys
    assert r[:errors].include?(:password)
  end

end
