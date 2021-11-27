require 'test_helper'

class PacksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get packs_index_url
    assert_response :success
  end

  test "should get show" do
    get packs_show_url
    assert_response :success
  end

end
