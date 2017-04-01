class IssuesController < ApplicationController

	def index
		issues = Issue.all

		if max_hour = params[:hour]
			issues = issues.where(hour: max_hour)
		end
		render json: issues, status: 200
		

	end
end