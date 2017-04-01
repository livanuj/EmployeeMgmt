class IssuesController < ApplicationController

	def index
		issues = Issue.all

		if search_hour = params[:hour]
			issues = issues.where(hour: search_hour)
		end
		render json: issues, status: 200
	end

  def create
    issue = Issue.new(issue_params)

    if issue.save
      render json: issue, status: 201, location: issue
    else
      render json: issue.errors, status: 422
    end
  end

  private

  def issue_params
    params.require(:issue).permit(:issue, :hour)
  end

end