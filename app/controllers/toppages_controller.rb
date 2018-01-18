class ToppagesController < ApplicationController
	def index
		@bicycles = Bicycle.order(created_at: :desc).limit(10)
	end
end