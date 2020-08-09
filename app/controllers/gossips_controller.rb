class GossipsController < ApplicationController

  before_action :authenticate_user, only: [:create, :new]

  def show
    @gossip = Gossip.find(params[:id])
    @comment = Comment.new
  end

  def new

  end

  def create
    user = current_user
    @gossip = Gossip.new(title: params['title'], content: params['content'], user: user)
    
    if @gossip.save
      redirect_to '/?gossipRegistered=true'
    else
     render :new
    end
  
  end

  def edit
    @gossip = Gossip.find(params[:id])
  end

  def update
    @gossip = Gossip.find(params[:id])
    
    if current_user == @gossip.user
      if @gossip.update(post_params)
        redirect_to '/?gossipUpdated=true'
      else
        render :edit
      end
    else
      redirect_to gossip_path(@gossip.id, gossipUpdated: 'errNotAuthor')
    end
  end

  def destroy
    @gossip = Gossip.find(params[:id])

    if current_user == @gossip.user
      @gossip.destroy
      redirect_to '/?gossipDestroyed=true'
    else
      redirect_to gossip_path(@gossip.id, gossipDestroyed: 'errNotAuthor')
    end

    
  end

  private

  def post_params
    return params.require(:gossip).permit(:title, :content)
  end

  def authenticate_user
    unless current_user
      redirect_to new_session_path(err: 'notLogged', redirect: 'new_gossip_path')
    end
  end

end
