class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			sign_in @user
			redirect_to user_url(@user), :notice => "Welome to the app, #{@user.name}!"
		else
			render :new
		end
	end

	def show
		@user = User.find(params[:id])
		@available_products = @user.available
		if current_user == @user
			@product = Product.new
			@sales = @user.sales
			@purchases = @user.purchases
		end
	end

	private
	def user_params
		params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
	end
end
