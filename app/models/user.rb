class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :avatar
  validates :name, :presence => true
  has_attached_file :avatar, :styles => { :thumb => "100x100>" }, :default_url => "/assets/rails.png", :url => "/assets/users/:id/:style/:basename.:extension",
  :path => ":rails_root/public/assets/users/:id/:style/:basename.:extension"
  has_many :docs
  has_many :doc_items, :through => :doc
  # attr_accessible :title, :body
end
