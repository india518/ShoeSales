class ProductsController < ApplicationController

	def create
		@product = current_user.products.new(params[:product])
		if @product.save
		redirect_to user_url(current_user), :notice => "#{@product.name}s listed!"
		else
		  redirect_to user_url(current_user), :alert => "Purchase not listed!"
		end
	end

	def update
	end

	def destroy
		@product = Product.find(params[:id])
		@product.destroy
		redirect_to user_url(current_user)
	end
end
