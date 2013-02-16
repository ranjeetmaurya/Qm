class UsersController < ApplicationController

	def index
	end

	def new
		@user = User.new
		4.times {@user.needs.build}
		4.times {@user.offerings.build}
	end

	def profile
		@user = User.find(params[:id])

	end

	def create
		@user = User.new(params[:user])
		@user.save!(:validate => false)
		redirect_to profile_user_path(@user)
	end

	def update

	end

end
# def create
#   session[:order_params].deep_merge!(params[:order]) if params[:order]
#   @order = Order.new(session[:order_params])
#   @order.current_step = session[:order_step]
#   if @order.valid?
#     if params[:back_button]
#       @order.previous_step
#     elsif @order.last_step?
#       @order.save if @order.all_valid?
#     else
#       @order.next_step
#     end
#     session[:order_step] = @order.current_step
#   end
#   if @order.new_record?
#     render "new"
#   else
#     session[:order_step] = session[:order_params] = nil
#     flash[:notice] = "Order saved!"
#     redirect_to @order
#   end
# end