# coding: utf-8

class ContactMailer < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.contact_mailer.sent.subject
  #
  def sent(contact)
    @contact = contact
    mail(:to => "【送信先メールアドレス】", :from => @contact.email, :subject => 'フォームからのお問い合わせ')
  end
end
