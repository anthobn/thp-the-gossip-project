class LikesController < ApplicationController
  def create
    Like.create(user: current_user, gossip_id: params['gossip_id'])
    redirect_to '/'
  end

  def destroy
    @like = Like.find(params[:id])

    if current_user == @like.user
      @like.destroy
      redirect_to '/'
    else
      redirect_to '/?notAuthor=true'
    end

  end
end
