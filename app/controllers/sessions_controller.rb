class SessionsController < ApplicationController

#creates a new user user when user logs in through meetup.
  def create
    auth = request.env["omniauth.auth"]
    user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)
    session[:user_id] = user.id
    redirect_to member_url, :notice => "Signed in!"
  end

#destroys a user session when user logs out
  def destroy
    User.find_by_id(session[:user_id]).destroy
    session[:user_id] = nil

    redirect_to root_url, :notice => "Signed out!"
  end
end
