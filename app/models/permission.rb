class Permission < ActiveRecord::Base
  attr_accessible :thing_id, :user_id, :thing_type, :action
  belongs_to :user
  belongs_to :thing, :polymorphic => true

end
