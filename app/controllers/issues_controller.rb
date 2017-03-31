class IssuesController < ApplicationController

	def index
		issues = Issue.all
		render json: issues, status: 200
		
	end
end