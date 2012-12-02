# -*- encoding : utf-8 -*-
class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :init_menu
  

  private

  	def init_menu
  		#@about = Infopage.where(:tag => "about").first
  		# @@cs = Category.all
  		# @about = @@cs[0]
  		# @delivery = @@cs[1]
  		# @water = @@cs[2]
  		@@cs = Infopage.where(parent_id: nil)
  		@c1pages = Infopage.where(:column => 1).all
  		@c2pages = Infopage.where(:column => 2).all
  		@c3pages = Infopage.where(:column => 3).all
  	end

	  def admin_require
	    unless is_admin?
	      deny_access 
	    end  
	  end  
	  
	  def deny_access
	    flash[:error] = "you have no accessible right/ access denied." 
	    redirect_to root_path #root_url
	  end
	  

	  def is_admin?
	    if current_user
	      !!current_user.isAdmin?
	    else 
	      return false
	    end
	  end
end
