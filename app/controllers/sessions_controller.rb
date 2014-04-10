class SessionsController < ApplicationController
  skip_before_action :authentication_required, :except => [:destroy]

  def new
  end

  def create
    auth = request.env["omniauth.auth"]
    user = User.find_by(provider: auth["provider"], uid: auth["uid"]) || User.create_with_omniauth(auth)
    session[:user_id] = user.id
    redirect_to root_url#, :notice => "Signed in!" # optional
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url#, :notice => "Signed out!" # optional
  end
end
