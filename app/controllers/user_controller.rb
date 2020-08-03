class UserController < ApplicationController
  def showUser
    @user = User.where(id: params['id'])[0]
  end
end
