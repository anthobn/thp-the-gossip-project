class SessionsController < ApplicationController
  def new
   
  end
  
  def create
    user = User.find_by(mail: params['mail'])

    if user && user.authenticate(params['password'])
      session[:user_id] = user.id
      redirect_to '/?connect=success'
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to '/?disconnect=success'
  end

end
