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

  
end
