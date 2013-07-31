class ContactsController < ApplicationController

  before_filter :authorize, only: [:index, :show, :destroy]
  #http_basic_authenticate_with name: ADMIN_CONFIG['username'], password: ADMIN_CONFIG['password'];

	def index
	  @contacts = Contact.all

	  respond_to do |format|
	   format.html # index.html.erb
	   format.json { render json: @contacts }
	  end

  end

  def show
    @contact = Contact.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @conatact }
    end
  end

  def new
    @conatact = Contact.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @conatact }
    end
  end


  def create
  	
		@contact = Contact.new(params[:contact])
    @contact.remote_ip = request.remote_ip
    @contact.user_agent = request.headers["user-agent"]

    respond_to do |format|
      if @contact.save
        p_status = Prowler.notify "New Email: #{@contact.name} (#{@contact.email})", 
          "Subject:#{@contact.subject}\n #{contact_url(@contact)}"
        format.js
      else
        format.js
      end
    end
		#ContactMailer.email_success(params[:mail_form]).deliver
		#respond_to do |format|
		#flash.now[:notice] = "Your email was sent successfully!"
		#	format.js
		#end
  end

  # DELETE /contacts/1
  # DELETE /contacts/1.json
  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy

    respond_to do |format|
      format.html { redirect_to contacts_url }
      format.json { head :no_content }
    end
  end

end
