require 'test_helper'

class CreatingIssuesTest < ActionDispatch::IntegrationTest
  test 'creating new issues' do    
    post '/issues', params: { issue: {
      issue: 'task 1',
      hour: 8,
      description: 'working on test issue 1'
    } }.to_json, headers: { 'Accept' => 'application/json',
                           'Content-Type' => 'application/json' }

    assert_equal 201, response.status
    assert_equal Mime[:json], response.content_type
    issue = json(response.body)
    assert_equal issue_url(issue[:id]), response.location

    assert_equal 'task 1', issue[:issue]
    assert_equal 8, issue[:hour].to_i
    assert_equal 'working on test issue 1', issue[:description] 
  end

  test 'does not create issues with invalid data' do
    post '/issues', params: { issue: {
      issue: nil,
      hour: 8
    } }.to_json, headers: { 'Accept' => 'application/json',
                           'Content-Type' => 'application/json' }

    assert_equal 422, response.status

  end

end
