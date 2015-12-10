require 'test_helper'

class Users::RegistrationsControllerTest < ActionController::TestCase

  def setup
    request.env['devise.mapping'] = Devise.mappings[:user]
    @current_user = users(:one)
  end

  def valid_user_object(response)
    valid = true
    valid = false unless response[:id].class == Fixnum
    valid = false unless user = User.find_by(id: response[:id])
    valid = false unless user.email.include?('@') && user.email.include?('.')
    return valid
  end

  test 'POST #create will register a new user with a valid email and matching passwords' do
    number_of_users = User.all.length
    params = {
      user: {
        email: 'test_email@mydomain.com',
        password: 'password',
      },
      format: :json
    }
    post :create, params
    assert_response 201
    assert User.all.length == number_of_users + 1
    r = JSON.parse(@response.body).deep_symbolize_keys
    assert valid_user_object(r)
  end

  test 'POST #create will not register a new user if email does not include one and only one "@" and at least one "."' do
    number_of_users = User.all.length
    p1 = {
      user: {
        email: 'test_emailmydomain.com',
        password: 'password',
      },
      format: :json
    }
    p2 = {
      user: {
        email: 'test@email@mydomain.com',
        password: 'password',
      },
      format: :json
    }
    p3 = {
      user: {
        email: 'test_email@mydomaincom',
        password: 'password',
      },
      format: :json
    }
    params = [p1, p2, p3]
    params.each_with_index do |p, index|
      post :create, p
      assert_response 422
      assert User.all.length == number_of_users
      r = JSON.parse(@response.body).deep_symbolize_keys
      assert r[:errors].include?(:email)
    end
  end

  test 'POST #create will not register a new user if password is not at least 8 characters' do
    number_of_users = User.all.length
    params = {
      user: {
        email: 'test_email@mydomain.com',
        password: 'not8',
      },
      format: :json
    }
    post :create, params
    assert_response 422
    assert User.all.length == number_of_users
    r = JSON.parse(@response.body).deep_symbolize_keys
    assert r[:errors].include?(:password)
  end

end
