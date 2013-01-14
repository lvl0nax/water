# -*- encoding : utf-8 -*-
class OrderMailer < ActionMailer::Base
	default from: "noreply@prima-aqua.com"

	def new_order_mail(options)
		@order = options
		# emails = "lvl0nax@gmail.com,lvl0nax@yandex.com"
		emails = "9856544@gmail.com,akvapolus@restsguide.ru,lider-aqva@metropost.ru"
		mail to: emails, subject: "Сайт: новый заказ"
	end

	def new_call_mail(options)
		@call = options
		emails = "9856544@gmail.com,akvapolus@restsguide.ru,lider-aqva@metropost.ru"
		mail to: emails, subject: "Сайт: Заказ звонка"
	end

	# def dev_call_mail(options)
	# 	@call = options
	# 	#mail to: 'akvapolus@restsguide.ru', subject: "Сайт: Заказ звонка"
	# end

	# def dev_mail(options)
	# 	@order = options
	# 	mail to: 'lvl0nax@gmail.com', subject: "New order"
	# 	mail to: 'Olesya.Mikhalkova@gmail.com', subject: "New order"
	# end

end
