require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  test "invalid signup information" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, params: {user: {name: " ", email: "bkdcbskdbc", password: "dcjb", password_confirmation: "vcjsv"}}
    end
  assert_template 'users/new'
  end

  test "valid signup information" do
    get signup_path
    assert_difference 'User.count', 1 do
      post users_path, params: {user: {name: "jitu", email: "qwer@abcd.com", password: "foobar", password_confirmation: "foobar"}}
    end
    follow_redirect!
    assert_template 'users/show'
    assert is_logged_in?
  end
end

