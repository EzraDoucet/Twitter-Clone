class ProfilesController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @followers = Relationship.where(friend_id: @user.id).map {|user| User.find(user.user_id)}
  end
end