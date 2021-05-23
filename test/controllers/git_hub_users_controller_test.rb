require "test_helper"

class GitHubUsersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get git_hub_users_index_url
    assert_response :success
  end
end
