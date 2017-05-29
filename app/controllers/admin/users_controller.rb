# we let the controller inherit from the Admin::BaseController !! 
class Admin::UsersController < Admin::BaseController

  def index
    @users = User.order(created_at: :desc)
  end


end
