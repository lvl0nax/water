class OrderMailer < ActionMailer::Base
default from: "noreply@travel.com"

def new_order_mail(options)
	@order = options
	mail to: 'Neodelfik@rambler.ru', subject: "New order"
	
end

end
