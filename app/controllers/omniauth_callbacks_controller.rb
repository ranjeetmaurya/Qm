class OmniauthCallbacksController <  Devise::OmniauthCallbacksController
	skip_before_filter :require_no_authentication, :only => [:new, :create]

	def all
		#linkedin_user = User.from_omniauth(request.env["omniauth.auth"])
		#sign_in :user, linkedin_user
		auth = request.env["omniauth.auth"]
		session[:user_data_from_linkedin] = {:first_name => auth.info.first_name, :last_name => auth.info.last_name, :email => auth.info.email, :provider => auth.provider, :uid =>  auth.uid, :linked_in_image_url => auth.info.image, :linked_public_profile => auth.info.urls.public_profile}
		redirect_to new_user_path
	end
	alias_method :linkedin, :all
end
