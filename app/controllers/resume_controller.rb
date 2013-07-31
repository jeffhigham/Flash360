class ResumeController < ApplicationController

	#resume_auth = Resume.first()
	#http_basic_authenticate_with name: resume_auth[:username], password: resume_auth[:password];
	def index
		redirect_to new_resume_path unless session[:resume_allowed] = true
		prowler = Prowler.new(:delayed => true)
		p_status = Prowler.notify "Resume View", 
          "#{request.remote_ip}, #{request.headers['user-agent']}"
	end

	def new
		@question = "What is the sum of two plus two?"
	end

	def create
	  if params[:answer] == 4
	    session[:resume_allowed] = true
	    redirect_to resume_index_path
	  else
	    redirect_to new_resume_path
	  end
  	end

	def destroy
	    session[:resume_allowed] = nil
		redirect_to root_url
	end
	
end