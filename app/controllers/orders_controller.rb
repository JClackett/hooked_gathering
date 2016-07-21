class OrdersController < ApplicationController
	require 'Mollie/API/Client'

	def destroy
	  current_order.destroy
	  session[:order_id] = nil
	  redirect_to root_path, :notice => "Basket emptied successfully."
	end

	def checkout
	  @order = Shopr::Order.find(current_order.id)
	  if request.patch?
	    # if @order.proceed_to_confirm(params[:order].permit(:first_name, :last_name, :billing_address1, :billing_address2, :billing_address3, :billing_address4, :billing_country_id, :billing_postcode, :email_address, :phone_number))
	      	redirect_to checkout_confirmation_path
	    # end
	  end
	end

	def confirmation
		@order = Shopr::Order.find(current_order.id)
		mollie = Mollie::API::Client.new
		mollie.setApiKey 'test_kBn4UATMKjcRD4VGEQPsz5UVuyQ6bA'

		# puts @order.order_items.first.inspect

		order_id = Time.now.to_i

		order_id_string = order_id.to_s

		path = 'http://localhost:3000?order_id='
		redirectURL = path + order_id_string

		payment = mollie.payments.create({
			:amount      => @order.total,
			:description => 'Merchandise',
			:redirectUrl => redirectURL,
			:metadata    => {
				:order_id =>  order_id
			}
		})

		# puts payment.inspect

		redirect_to payment.getPaymentUrl

	end

end
