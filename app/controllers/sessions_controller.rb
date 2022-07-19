class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(username: params[:user][:username])
    @user = @user.try(:authenticate, params[:user][:password])
    return redirect_to(controller: 'sessions', action: 'new') unless @user
    session[:user_id] = @user.id
    redirect_to controller: 'welcome', action: 'home'
  end

  def omniauth
    @user = User.find_or_create_by(uid: auth['uid']) do |u|
      u.name = auth['info']['name']
      u.email = auth['info']['email']
      u.image = auth['info']['image']
      u.password = auth['uid']
    end
    session[:user_id] = @user.id
    render 'welcome/home'
  end

  def destroy
    session.delete :user_id
    redirect_to '/'
  end

  private

  def auth
    request.env['omniauth.auth']
  end
end
