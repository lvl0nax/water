class OrderMailer < ActionMailer::Base
default from: "noreply@travel.com"

def new_order_mail(options)
	@order = options
	mail to: 'lvl0nax@gmail.com', subject: "New order"
	
end

end
