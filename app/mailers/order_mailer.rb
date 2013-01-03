# -*- encoding : utf-8 -*-
class OrderMailer < ActionMailer::Base
	default from: "noreply@travel.com"

	def new_order_mail(options)
		@order = options
		mail to: 'lider-aqua@metropost.ru', subject: "Новый заказ"
	end

	def dev_mail(options)
		@order = options
		mail to: 'akvapolus@restsguide.ru', subject: "Новый +заказ"
	end
	
	def new_call_mail(options)
		@call = options
		mail to: 'lider-aqua@metropost.ru', subject: "Заказ звонка"
	end

	def dev_call_mail(options)
		@call = options
		mail to: 'akvapolus@restsguide.ru', subject: "Заказ звонка"
	end

	# def dev_mail(options)
	# 	@order = options
	# 	mail to: 'lvl0nax@gmail.com', subject: "New order"
	# 	mail to: 'Olesya.Mikhalkova@gmail.com', subject: "New order"
	# end

end
