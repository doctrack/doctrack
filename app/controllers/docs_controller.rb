class DocsController < ApplicationController
   before_filter :authenticate_user!
  
  def show
    @doc = current_user.docs.find(params[:id])
    @docitem = DocItem.where(:doc_id => @doc.id).all
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
  end

  def edit
    @doc = Doc.find(params[:id])
  end

  def destroy
    
  end
  
  def add_collabarator
    @doc_id = params[:id]
    
  end
  
  def create_collabarator
    @doc_id = params[:id]
     @user = User.find_by_username(params[:name])
    if(@user)
      
    @permission = Permission.new
    @permission.thing = Doc.find(params[:id])
    @permission.user_id = @user.id
    if(@permission.save)
      
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

  
end
