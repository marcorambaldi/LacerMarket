class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?
	before_action :store_location

	protected

  	def configure_permitted_parameters
    	devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    	devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  	end

  	def store_location
  		return unless request.get?
  		if (request.path != "/users/sign_in" &&
	        request.path != "/users/sign_up" &&
	        request.path != "/users/password/new" &&
	        request.path != "/users/password/edit" &&
	        request.path != "/users/confirmation" &&
	        request.path != "/users/sign_out" &&
	        !request.xhr?) # don't store ajax calls
	      store_location_for(:user, request.fullpath)
    	end
  	end

  	def after_sign_in_path_for(resource)
		session[:previous_url] || root_path  		
  	end
end
