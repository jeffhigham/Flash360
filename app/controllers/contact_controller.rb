class ContactController < ApplicationController
  def index
  
  end

  def create
		
		ContactMailer.email_success(params[:mail_form]).deliver
		respond_to do |format|
			flash.now[:notice] = "Your email was sent successfully!"
			format.js
		end

  end

end
