class GossipsController < ApplicationController

  before_action :authenticate_user, only: [:create, :new]

  def show
    @gossip = Gossip.find(params[:id])
    @comment = Comment.new
  end

  def new

  end

  def create
    anonymous = User.where(mail: 'anonymous@anonymous.com')[0]
    @gossip = Gossip.new(title: params['title'], content: params['content'], user: anonymous)
    
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
    
    if @gossip.update(post_params)
      redirect_to '/?gossipUpdated=true'
    else
      render :edit
    end
  end

  def destroy
    @gossip = Gossip.find(params[:id])
    @gossip.destroy
    redirect_to '/?gossipDeleted=true'
  end

  private

  def post_params
    return params.require(:gossip).permit(:title, :content)
  end

  def authenticate_user
    unless current_user
      redirect_to new_session_path(err: 'notLogged')
    end
  end

end
