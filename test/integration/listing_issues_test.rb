require 'test_helper'

class ListingIssuesTest < ActionDispatch::IntegrationTest
	setup do
		Issue.create!(issue: "Test issue", hour: 8)
		Issue.create!(issue: "Test issue 2", hour: 7)
	end

	test 'listing issues' do
		get '/issues'

		assert_equal 200, response.status
		assert_equal Mime[:json], response.content_type

		assert_equal Issue.count, json(response.body).size
	end

	test 'max hours worked' do
		get '/issues?hour=8'

		assert_equal 200, response.status
		assert_equal Mime[:json], response.content_type

		assert_equal 1, json(response.body).size
	end

end
