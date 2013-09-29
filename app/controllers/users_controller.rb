class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    @users = User.all
    
  end

  def show
    @user = current_user
    @doc = current_user.docs
  end
end
