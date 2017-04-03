require 'test_helper'

class ListingIssuesTest < ActionDispatch::IntegrationTest
	setup do
		@anuj = User.create!(name: "Anuj Shrestha", email: "livanuj@gmail.com")

		@anuj.issues.create!(issue: "Test issue", hour: 8)
		@anuj.issues.create!(issue: "Test issue 2", hour: 7)
	end

	test 'listing issues' do
		get '/issues'

		assert_equal 200, response.status
		assert_equal Mime[:json], response.content_type

    #byebug
    issues = json(response.body)
		assert_equal Issue.count, issues.size
		issue = issues.first
		assert_equal @anuj.id, issue[:user_id]
	end

	test 'max hours worked' do
		get '/issues?hour=8'

		assert_equal 200, response.status
		assert_equal Mime[:json], response.content_type

		assert_equal 1, json(response.body).size
	end

end
