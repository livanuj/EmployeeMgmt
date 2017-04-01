class CompletedIssuesController < ApplicationController
	def index
	issues = Issue.finished
		respond_to do |format|
			format.json {render json: issues, status: 200}
			format.xml {render xml: issues, status: 200}			
		end
	end


end
