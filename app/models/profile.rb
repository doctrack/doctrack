class Profile < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :mobile, :public_email, :avatar
  validates :public_email, :email_format => {:message => 'is not correct format'}, :allow_blank => true
  has_attached_file :avatar, :styles => { :thumb => "100x100>" }, :default_url => "/assets/rails.png", :url => "/assets/users/:id/:style/:basename.:extension",
  :path => ":rails_root/public/assets/users/:id/:style/:basename.:extension"
  belongs_to :user
end
