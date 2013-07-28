class ContactMailer < ActionMailer::Base
  default to: 'flash360tech@gmail.com'
  default subject: 'Email From Flash360.pro'
  default template_path: 'notifications'
  default template_name: 'email_success'

  def email_success(mail_form)
    @mail_form = mail_form
    mail from: @mail_form[:email], reply_to: @mail_form[:email]
  end

end