class ProfilesController < ApplicationController
  before_filter :authenticate_user!
  
  def show
    @profile = current_user.profile
    
  end
 
  def new
   @profile = current_user.build_profile
  end
  
  def create 
    @profile = current_user.build_profile(params[:profile])
    if(@profile.save)
     redirect_to([@profile], :notice => "Profile Saved Successfully") 
    else
      render :action => 'new'
   end
    
 end
  
  
  def edit
    
    if current_user.profile.nil?
      @profile = current_user.build_profile
    else
      @profile = current_user.profile
    end
  
  end

  def update
    @profile = current_user.profile
    @profile = @profile.update_attributes(params[:profile])
    if(@profile.save)
     redirect_to([current_user, @profile], :notice => "Profile Updated Successfully") 
    else
      render :action => 'edit'
   end
    
    
  end

  


end
