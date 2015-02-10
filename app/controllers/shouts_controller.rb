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
		@shout = Shout.new(shout_params)
		@shout.user_id = params[:user_id]
		@shout.save
	end

	def destroy
		@shout.destroy
		redirect_to:(action => :index, notice: 'Boom. Shout destroyed!') 
	end

	private

	def set_shout
		@shout = Shout.find(params[:user_id])

	def shout_params
		params.require(:shout).permit(:body, :user_id)
	end

end