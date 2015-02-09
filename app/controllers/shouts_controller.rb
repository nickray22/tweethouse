class ShoutsController < ApplicationConroller
	def index
		@shouts = Shout.all
	end

	def show
		@shout = Shout.find(params[:id])
		render :show
	end

	def new
		@shout = Shout.new
		render :new
	end

	def create
		@shout = Shout.new(post_params)
		@shout.user_id = params[:user_id]
	end

	def destroy
		@shout.destroy
	end

	private

	def set_shout
		@shout = Shout.find(params[:user_id])

	def shout_params
		params.require(:shouts).permit(:body)
	end

end