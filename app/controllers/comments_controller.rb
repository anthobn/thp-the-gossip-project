class CommentsController < ApplicationController
  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    
    if @comment.update(post_params)
      redirect_to gossip_path(@comment.gossip.id, commentUpdated: 'true')
    else
      render :edit
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to gossip_path(@comment.gossip.id, commentDestroyed: 'true')
  end

  private

  def post_params
    return params.require(:comment).permit(:content)
  end
  
end
