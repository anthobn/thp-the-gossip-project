class CommentsController < ApplicationController
  def edit
    @comment = Comment.find(params[:id])
  end

  def new
    
  end

  def create
    Comment.create(content: post_params['content'], user: current_user, gossip_id: params['gossip_id'])
    redirect_to gossip_path(params['gossip_id'], commentCreated: 'true')
  end

  def update
    @comment = Comment.find(params[:id])
    
    if current_user == @comment.user
      if @comment.update(post_params)
        redirect_to gossip_path(@comment.gossip.id, commentUpdated: 'true')
      else
        render :edit
      end
    else
      redirect_to gossip_path(@comment.gossip.id, commentUpdated: 'errNotAuthor')
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    
    if current_user == @comment.user
      @comment.destroy
      redirect_to gossip_path(@comment.gossip.id, commentDestroyed: 'true')
    else
      redirect_to gossip_path(@comment.gossip.id, commentDestroyed: 'errNotAuthor')
    end
    
  end

  private

  def post_params
    return params.require(:comment).permit(:content)
  end
  
end
