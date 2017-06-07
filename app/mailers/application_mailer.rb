class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com' # you can pick everything you want, but it it does not come from your email IP address, it's likely it will come in the spam inbox.
  layout 'mailer'
end
