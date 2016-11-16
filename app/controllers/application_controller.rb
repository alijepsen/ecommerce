class ApplicationController < ActionController::Base
	after_filter :store_location
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def store_location
	  # store last url as long as it isn't a /users path
	  session[:previous_url] = request.fullpath unless request.fullpath =~ /\/users/
	end

	def after_sign_in_path_for(resource)
	  session[:previous_url] || root_path
	end

   def configure_permitted_parameters
     devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
   end
end
