class AdminDashboardController < ApplicationController
 before_filter :authenticate_user!
 before_filter :check_if_admin 
	def dash

    end	

   
    def manage_user 	
    	@user=User.where(:admin=>false)
    end
 
  def usr_change

	  @user = User.find(params[:id])
    if (checked = "checked")
          if @user.is_active?
               
         	    @user.update_attribute(:is_active,false)	
               @user.save
                redirect_to manage_user_admin_dashboard_index_path
           else  
   
            @user.update_attribute(:is_active,true)	 
             @user.save
             redirect_to manage_user_admin_dashboard_index_path 
            end
      else
            redirect_to  root_path      
      end         # if @user.save
               #         redirect_to manage_user_admin_dashboard_index_path
     
               # else
               #           redirect_to   new_user_session_path
               # end 
 end
     
 

 
	protected

	def check_if_admin
		unless current_user.admin?
		 reset_session
	  redirect_to(new_user_session_path) 
	end
	end
end 
