class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?



	def after_sign_up_path_for(resource)
		root_path
	end
	def after_sign_in_path_for(resource)
  		if user_signed_in?
  			root_path
  		else
  			admin_manager_products_path
  		end
	end

	def after_sign_out_path_for(resource)
  		top_path
	end
	
	def require_login
		unless current_user
			redirect_to new_user_session_path
		end
	end

	def require_admin_login
		unless curent_admin
			redirect_to root_path
		end
	end

	def require_admin_alredy
		if current_admin
			redirect_to admin_manager_products_path
		end
	end
	
	def require_user_alredy
		if current_user
			redirect_to root_path
		end
	end

	def configure_permitted_parameters
		added_attrs = [:name,:email,:password,:password_confirmation]
		devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
		devise_parameter_sanitizer.permit :account_update, keys: added_attrs
		devise_parameter_sanitizer.permit :sign_in, keys: [:email , :password]
	end
end
