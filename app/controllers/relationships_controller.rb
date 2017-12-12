class RelationshipsController < ApplicationController

  def create
    @relationship = current_user.relationships.build(friend_id: params[:friend_id])
    @friend = User.find(params[:friend_id])

    if @relationship.save
      flash[:notice] = "You followed #{@friend.username}"
      redirect_to profile_path(params[:friend_id])
    else
      flash[:alert] = "Something went wrong try again."
      redirect_to profile_path(params[:friend_id])
    end
  end

  def destroy
    @relationship = current_user.relationships.find(params[:id])
    @relationship.destroy
    @ex_friend = User.find(params[:friend_id])

    flash[:notice] = "You are no longer following #{@ex_friend.username}"
    redirect_to profile_path(current_user.id)
  end

  private

  def relationship_params
    params.require(:relationship).permit(:user_id, :friend_id)
  end

end
