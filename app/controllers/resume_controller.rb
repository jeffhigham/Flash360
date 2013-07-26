class ResumeController < ApplicationController

	resume_auth = Resume.first()
	http_basic_authenticate_with name: resume_auth[:username], password: resume_auth[:password];
	def index
		
	end
	
end