class UsersController < ApplicationController
	before_action :load_user, only: [:show, :destroy]
  def new
  	@user = User.new
  end

   def create
    	@user = User.new(user_params)
    if @user.save
    	log_in @user
    	flash[:success] = "Irasshaimase, kono okama yarou!"
		redirect_to @user
	else
      render 'new'
    end
  end

  def show
  end

  def destroy
  	@user.destroy
  	# redirect_to users_url 
  end

  def index
  	@users = User.all
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end

    def load_user
    	@user = User.find(params[:id])
    	
    end





end
