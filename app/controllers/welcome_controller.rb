class WelcomeController < ApplicationController
before_action :get_instagram

	def home
		@guests = Guest.limit(10)
	end

	private

	def get_instagram
		access_token = ENV["instagram_access_token"]
		url = 'https://api.instagram.com/v1/users/self/media/recent/?access_token='
		uri = url + access_token
		response = HTTParty.get(uri)
		data = response["data"]
		data = data[0..8]
		@instagram_images=[]
		data.each do |data|
			if data['images']
				image_url = data["images"]["standard_resolution"]["url"]
				@instagram_images.push(image_url)
			end
		end
	end

end