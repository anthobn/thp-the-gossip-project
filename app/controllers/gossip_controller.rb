class GossipController < ApplicationController
  def showGossip
    @gossip = Gossip.where(id: params['id'])[0]
  end
end
