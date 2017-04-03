require 'test_helper'

class ListingUsersTest < ActionDispatch::IntegrationTest
  test 'list users' do
    get '/users'

    assert_equal 200, response.status
    assert_equal Mime[:json], response.content_type
  end
end
