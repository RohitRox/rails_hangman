class SessionsController < ApplicationController
  def new
  end

  def create

  auth_hash = request.env['omniauth.auth']
  if session[:user_id]
    # Means our user is signed in. Add the authorization to the user
    User.find(session[:user_id]).add_provider(auth_hash)
 
    render :text => "You can now login using #{auth_hash["provider"].capitalize} too!"
  else
    # Log him in or sign him up
    auth = Authorization.find_or_create(auth_hash)
 
    # Create the session
    session[:user_id] = auth.user.id
    session[:auth_id] = auth.id
    redirect_to root_path, notice: "Welcome #{auth.user.name}."
  end

  end

  def failure
  end

  def destroy
  	session[:user_id] = nil
    session[:auth_id] = nil
    redirect_to root_path, notice: 'You have logged out'
  end

end
