class UsersController < ApplicationController

	before_filter :authenticate_user!, :except => [:create, :new, :edit]

	def index
	end

	def new
		@user = User.find_by_uid(session[:user_data_from_linkedin][:uid])
		if @user
			session[:user_data_from_linkedin] = nil
			sign_in :user, @user
			redirect_to profile_user_path(@user)
		else
			session[:user_params] ||= session[:user_data_from_linkedin] 
			@user = User.new(session[:user_params])
			5.times {@user.needs.build}
			5.times {@user.offerings.build}
			@user.current_step = session[:user_step]
		end
	end

	def profile
		@user = User.find(params[:id])
	end

	def create
		session[:user_params].merge!(params[:user]) if params[:user]
		@user = User.new(session[:user_params])
		@user.current_step = session[:user_step]
		if @user.valid?
			if params[:back_button]
				@user.previous_step
				5.times {@user.needs.build} if @user.needs.size == 0
				5.times {@user.offerings.build} if @user.offerings.size == 0
			elsif @user.last_step?
				@user.save
			else
				@user.next_step
				5.times {@user.needs.build} if @user.needs.size == 0
				5.times {@user.offerings.build} if @user.offerings.size == 0
			end
			session[:user_step] = @user.current_step
		end
		if @user.new_record?
    	render "new"
  	else
	    session[:user_step] = session[:user_params] = nil
	    flash[:notice] = "User saved!"
	    sign_in :user, @user
	    redirect_to sign_up_success_user_path(@user) 
  	end
	end

	def edit
		@user = User.find(params[:id])
	end

	def sign_up_success
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		@user.update_attributes(params[:user])
		redirect_to profile_user_path(@user)
	end

end
