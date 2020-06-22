require 'test_helper'

class CreeksControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get creeks_new_url
    assert_response :success
  end

  test "should get show" do
    get creeks_show_url
    assert_response :success
  end

end
