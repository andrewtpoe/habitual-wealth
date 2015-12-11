class HomeControllerTest < ActionController::TestCase

  def setup
    @current_user = users(:one)
  end

  test 'GET #app renders correctly if user is signed in' do
    sign_in(:user, @current_user)
    get :app
    assert_response 200
    assert_template 'home/app'
  end

  test 'GET #app redirects to and home page if user is NOT signed in' do
    get :app
    assert_response 302
    assert_redirected_to root_path
  end

end
