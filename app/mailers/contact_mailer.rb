class ContactMailer < ActionMailer::Base
  default :to => "ndborkedaunt@yahoo.com"
  
  def send_contact_us_email(contact_mail)
    @contact_mail = contact_mail
	
    mail(:from => contact_mail.from,
         :subject => "From our Contact Us page")
  end
  
end
