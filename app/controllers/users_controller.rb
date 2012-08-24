class UsersController < ApplicationController
  
  
  def broadcast
  	@message = "just scored" + params[:score].to_s + "in category" + params[:category].to_s
  	respond_to do |format|
      format.html
      format.js
    end
  end


end
