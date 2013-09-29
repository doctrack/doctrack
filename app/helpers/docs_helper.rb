module DocsHelper 
  def get_chapters()
    display = ""
   
    @docitem.try(:each) do |chapter|
      display += "#{link_to chapter.chapter_name, edit_doc_page_path(:id => chapter.id, :doc_id => @doc.id)} <br />"
       
    end
    display
   
    
  end
end
