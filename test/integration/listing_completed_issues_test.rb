require 'test_helper'

class ListingCompletedIssuesTest < ActionDispatch::IntegrationTest
	setup do
		Issue.create!(issue: 'Finished', finished_at: 1.day.ago)
		Issue.create!(issue: 'Not Finished', finished_at: nil )

	end

  test 'lists completed issues in JSON' do
  	get '/completed_issues', params: {}, headers: {'Accept' => 'application/json'}

  	assert_equal 200, response.status
  	assert_equal Mime[:json], response.content_type

  	assert_equal 1, json(response.body).size
  end

  test 'lists completed issues in XML' do
  	get '/completed_issues', params: {}, headers: {'Accept' => 'application/xml'}

  	assert_equal 200, response.status
  	assert_equal Mime[:xml], response.content_type

  	assert_equal 1, Hash.from_xml(response.body)['issues'].size
  end

end
