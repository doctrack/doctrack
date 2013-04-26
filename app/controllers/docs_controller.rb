class DocsController < ApplicationController
   before_filter :authenticate_user!
  
  def show
   
    @doc = Doc.find(params[:id])
    @docitem = @doc.doc_items
    @chapter = @docitem.first
    authorize! :view, @doc
   
  end
 
  def new
   @doc = Doc.new 
  end
  
  def create 
    @doc = current_user.docs.new(params[:doc])
    if(@doc.save)
     redirect_to(docs_path, :notice => "Successfully Created The Document") 
    else
      render :action => 'new'
   end
    
  end
  
  def index
    @doc = current_user.docs.all
     @doc_friends = Permission.where(:user_id => current_user).all
  end

  def edit
    @doc = Doc.find(params[:id])
    
  end

  def destroy
    
  end
  
  def add_collabarator
    @doc_id = params[:id]
    
  end
  
  def set_permission(doc_id,user_id,action)
   is_present = Permission.where(:user_id => user_id, :thing_id => doc_id, :action => action).first
   unless(is_present)
    @permission = Permission.new
    @permission.thing = Doc.find(doc_id)
    @permission.user_id = user_id 
    @permission.action = action
    return @permission.save
    else
      return true
    end
    
    
  end
  
  def create_collabarator
    @doc_id = params[:id]
     @user = User.find_by_username(params[:name])
   if(@user)
      
     case params[:action_type].to_i
       when 1
         status = set_permission(params[:id],@user.id,'view')
       when 2
         status = set_permission(params[:id],@user.id,'view') && set_permission(params[:id],@user.id,'edit')
       else
         status = false
     end   
   
     if(status) 
        redirect_to(add_collabarator_doc_path, :notice => "Successfully Created The Document") 
     else
        flash.now[:alert] ="Sorry Unable To Add Collabarator"
        render :action => 'add_collabarator'
      
     end
    
    else
      flash.now[:alert] = "Sorry No User Found"
      render :action => 'add_collabarator'
      
    end
      
  end
  
  def show_friends_doc
    @doc_friends = Doc.where(:user_id => current_user).all
    
  end

  
end
