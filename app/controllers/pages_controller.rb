class PagesController < ApplicationController
  before_filter :authenticate_user!
  def index
    
  end

  def new
    
    @doc = Doc.find(params[:doc_id])
    authorize! :edit, @doc
    @chapter = @doc.doc_items.new
  end
  
  def create
    @doc = Doc.find(params[:doc_id])
    authorize! :edit, @doc
    @chapter = @doc.doc_items.new(params[:doc_item])
   
    if(@chapter.save)
     redirect_to(doc_path(@doc), :notice => "You Have Now Created A New Chapter") 
    else
      render :action => 'new'
   end 
  end
  
  def update
    @doc = Doc.find(params[:doc_id])
    authorize! :edit, @doc
    @doc_item = @doc.doc_items.find(params[:id])
    if @doc_item.update_attributes(params[:doc_item])
      redirect_to(doc_path(@doc), :notice => "Saved Successfully") 
    else
      render :action => "edit"
    end
    
  end

  def edit
    @doc = Doc.find(params[:doc_id])
    authorize! :edit, @doc
    @chapter = @doc.doc_items.find(params[:id])
  end
  
  def destroy
    @doc = Doc.find(params[:doc_id])
    authorize! :destroy, @doc
    @chapter = @doc.doc_items.find(params[:id])
    if(@chapter.destroy)
      redirect_to(doc_path(@doc))
    else
      render :action => 'edit'
      
    end
  end

  def show
     @doc = Doc.find(params[:doc_id])
    authorize! :view, @doc
    @chapter = @doc.doc_items.find(params[:id])
    respond_to do |format|
      
      format.js 
    end
    
  end
end
