class ResumeController < ApplicationController

	def index
		if !session[:resume_viewed] && !on_home_network?  
			prowler = Prowler.new(:delayed => true)
			p_status = Prowler.notify "Resume View", 
        		"#{request.remote_ip}, #{request.headers['user-agent']}"
      	session[:resume_viewed] = true
      	logger.info "Sending Push Notification: Resume View - #{request.remote_ip}, #{request.headers['user-agent']}"
     else
      	logger.info "Resume viewed suppressed, multiple views or on home network - #{request.remote_ip}, #{request.headers['user-agent']}"
     end
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
	
	private

	def on_home_network?
			if request.remote_ip =~ /10\.10\.100/ ||
				 request.remote_ip == '127.0.0.1'
				return true
			else
				return false
			end
	end

end