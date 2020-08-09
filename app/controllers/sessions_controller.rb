class SessionsController < ApplicationController
  def new
   
  end
  
  def create
    user = User.find_by(mail: params['mail'])

    if user && user.authenticate(params['password'])
      log_in(user)

      if params['redirect'] && params['redirect'] == "new_gossip_path"
        redirect_to new_gossip_path
      else
        redirect_to '/?connect=success'
      end

    else
      if params['redirect']
        redirect_to new_session_path(err: 'loginError', redirect: params['redirect'])
      else
        redirect_to new_session_path(err: 'loginError')
      end
    end
      
  end

  def destroy
    session.delete(:user_id)
    redirect_to '/?disconnect=success'
  end

end
