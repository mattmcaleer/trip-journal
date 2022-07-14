class SessionsController < ApplicationController
  def new
  end

  def create
#    @user = User.find_by(username: params[:username])
#    return head(:forbidden) unless @user.authenticate(params[:password])
#    session[:user_id] = @user.id

    @user = User.find_by(username: params[:user][:username])
    @user = @user.try(:authenticate, params[:user][:password])
    return redirect_to(controller: 'sessions', action: 'new') unless @user
    session[:user_id] = @user.id
    redirect_to controller: 'welcome', action: 'home'
  end

  def destroy
    session.delete :user_id

    redirect_to '/'
  end
end
