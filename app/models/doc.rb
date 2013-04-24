class Doc < ActiveRecord::Base
  attr_accessible :name, :type, :user_id, :status, :group_id
  has_many :doc_items
  belongs_to :user
  validates :name, :presence => true
  
end
