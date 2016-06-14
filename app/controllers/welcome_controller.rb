class WelcomeController < ApplicationController
	def home
		@guests = Guest.limit(10)
	end

	def tickets
	end

	private

end