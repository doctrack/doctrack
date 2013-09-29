class DocItem < ActiveRecord::Base
  attr_accessible :chapter_name, :content, :doc_id
  belongs_to :doc
  validates :chapter_name, :presence => true
end
 