class ApplicationController < ActionController::Base
  protect_from_forgery

    def after_sign_in_path_for(resource)
    	
      if current_user.admin?
      	 admin_dashboard_dash_path  
       else  	
            home_index_path
       end    	 
    end

    def after_sign_out_path_for(resource)
            new_user_session_path
    end

    def current_cart
      Cart.find(session[:cart_id])
      rescue ActiveRecord::RecordNotFound
      cart = Cart.create
      session[:cart_id] = cart.id
      cart
    end

end
