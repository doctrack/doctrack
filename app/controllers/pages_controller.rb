class PagesController < ApplicationController
  before_filter :authenticate_user!
  def index
    
  end

  def new
    
    @doc = current_user.docs.find(params[:doc_id])
    @chapter = @doc.doc_items.new
  end
  
  def create
    @doc = current_user.docs.find(params[:doc_id])
    @chapter = @doc.doc_items.new(params[:doc_item])
   
    if(@chapter.save)
     redirect_to(edit_doc_page_path(:doc_id => @doc, :id => @chapter), :notice => "You Have Now Created A New Chapter") 
    else
      render :action => 'new'
   end 
  end
  
  def update
    @doc = current_user.docs.find(params[:doc_id])
    @doc_item = @doc.doc_items.find(params[:id])
    if @doc_item.update_attributes(params[:doc_item])
      redirect_to(edit_doc_page_path(:doc_id => @doc, :id => params[:id] ), :notice => "Saved Successfully") 
    else
      render :action => "edit"
    end
    
  end

  def edit
    @doc = current_user.docs.find(params[:doc_id])
    @chapter = @doc.doc_items.find(params[:id])
  end
  
  def destroy
    @doc = current_user.docs.find(params[:doc_id])
    @chapter = @doc.doc_items.find(params[:id])
    if(@chapter.destroy)
      redirect_to(doc_path(@doc))
    else
      render :action => 'edit'
      
    end
  end

  def show
    
  end
end
