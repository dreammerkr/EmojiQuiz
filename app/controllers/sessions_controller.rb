class SessionsController < ApplicationController
  
  def new
    if is_loggedin
      redirect_to '/'
    end
  end
  
  def create
    
    
    @user = User.find_by(email: params[:email].downcase)
    if @user && @user.authenticate(params[:password])
      log_in(@user)
      redirect_to '/'
    else
      flash.now[:danger] = 'invalid login'
      render 'new'
    end
  end
  
  def destroy
    log_out
    redirect_to '/'
  end

end
