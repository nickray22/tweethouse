class ShoutsController < ApplicationController
  def index
    @shouts = @user.shouts
    render :index
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
  end

  def destroy
    @shout.destroy
    redirect_to root_path, notice: 'Boom. Shout destroyed!'
  end

  private

  def set_shout
    @shout = Shout.find(params[:user_id])
  end

  def shout_params
    params.require(:shout).permit(:body, :user_id)
  end

  def redirect_unless_user_match
    unless @user == current_user
      flash[:notice] = "You cannot perform actions on #{@user.username}"
      redirect_to :root
    end
  end
end
