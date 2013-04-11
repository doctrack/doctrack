module PagesHelper
  def chapter
    @chapter
  end
  
  def disp_doc_page_link
    link_to "Go To #{@doc.name}", doc_path(@doc)
  end
  
end
