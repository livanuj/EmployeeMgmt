require 'test_helper'

class ListingIssuesTest < ActionDispatch::IntegrationTest
	setup do
		Issue.create!(issue: "Test issue", hour: 8)
		Issue.create!(issue: "Test issue 2", hour: 7)
	end

	test 'listing issues' do
		get '/issues'

		assert_equal 200, response.status
		assert_equal Mime::JSON, response.content_type

		assert_equal Issue.count, JSON.parse(response.body).size
	end
end
