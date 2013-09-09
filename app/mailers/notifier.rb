class Notifier < ActionMailer::Base
  default from: "theteam@sample-app.com"

  def editor_notification(recipient)
  	@recipient = recipient
  	subject = "Invited as editor for Sample App"
  	mail(:to => @recipient.email, :subject => subject) unless @recipient.email.blank?
  end
end
