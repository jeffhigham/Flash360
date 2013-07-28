class ContactMailer < ActionMailer::Base
  default from: "flash360tech@gmail.com"
  default to: "flash360tech@gmail.com"

  def email_success(mail_form)
    @mail_form = mail_form
    mail from: @mail_form[:email], subject: "Email From Flash360.pro"
  end

end