class GossipsController < ApplicationController
  def show
    @gossip = Gossip.where(id: params['id'])[0]
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

end
