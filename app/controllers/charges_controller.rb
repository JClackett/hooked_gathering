class ChargesController < ApplicationController
	require 'Mollie/API/Client'

	def payment
		mollie = Mollie::API::Client.new
		mollie.setApiKey 'test_kBn4UATMKjcRD4VGEQPsz5UVuyQ6bA'

		order_id = Time.now.to_i

		order_id_string = order_id.to_s


		path = 'http://localhost:3000?order_id='
		redirectURL = path + order_id_string

		payment = mollie.payments.create({
			:amount      => 15.00,
			:description => 'My first payment',
			:redirectUrl => redirectURL,
			:metadata    => {
				:order_id =>  order_id
			}
		})

		puts payment.inspect

		redirect_to payment.getPaymentUrl
	end
end


