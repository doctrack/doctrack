class Ability
include CanCan::Ability
def initialize(user)
can :view, Doc do |doc|
  user.id == doc.user_id
end
can :edit, Doc do |doc|
  user.id == doc.user_id
end
can :destroy, Doc do |doc|
  user.id == doc.user_id
end
user.permissions.each do |permission|
can permission.action.to_sym, permission.thing_type.constantize do |thing|
thing.nil? ||
permission.thing_id.nil? ||
permission.thing_id == thing.id 
end
end

end
end
