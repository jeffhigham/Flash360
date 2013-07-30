class Contact < ActiveRecord::Base
  attr_accessible :email, :subject, :message, :name, :remote_ip, :user_agent
end