class ProductsController < ApplicationController

	def create
		@product = current_user.products.new(product_params)
		if @product.save
		redirect_to user_url(current_user), :notice => "#{@product.name}s listed!"
		else
		  redirect_to user_url(current_user), :alert => "Product not listed!"
		end
	end

	def update
	end

	def destroy
		@product = Product.find(params[:id])
		@product.destroy
		redirect_to user_url(current_user)
	end

	private
	def product_params
		params.require(:product).permit(:model, :brand, :amount)
	end
end
