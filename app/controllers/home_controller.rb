class HomeController < ApplicationController
  def index

  	@categories = Category.all
     
     if (params[:category_id])
     	
     	 if Category.find(params[:category_id]).parent.blank?
     	 	@products =Product.find(:all, :conditions => ["category_id  IN (?) OR category_id=?", Category.find(params[:category_id]).children,params[:category_id]])
     	 	 #@products = Category.find(params[:category_id]).children.products.paginate(:page => params[:page], :per_page => 9)
     	 else
     	  	  @products = Category.find(params[:category_id]).products.paginate(:page => params[:page], :per_page => 9)
     	 end 
  	  else
        @products = Product.paginate(:page => params[:page], :per_page => 9)

      end


 end 


end