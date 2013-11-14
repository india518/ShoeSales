class ProductsController < ApplicationController

	def index
		@products = Product.includes(:user).where(:buyer_id => nil)
	end

	def create
		@product = current_user.products.new(product_params)
		if @product.save
		redirect_to user_url(current_user), :notice => "#{@product.name}s listed!"
		else
		  redirect_to user_url(current_user), :alert => "Product not listed!"
		end
	end

	def update
		@product = Product.find(params[:id])
		@product.buyer_id = params[:product][:buyer_id]
		if @product.save
			redirect_to user_url(current_user),
				:notice => "#{@product.name} purchased!"
		else
			redirect_to user_url(current_user),
				:alert => "Unable to complete purchase of #{@product.name}."
		end
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
