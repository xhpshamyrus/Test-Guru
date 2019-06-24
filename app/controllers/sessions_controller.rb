class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to session[:url] || root_path
      flash[:notice] = 'Welcome to Guru!'
    else
      flash.now[:alert] = 'Incorrected login or password'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    session[:url] = nil

    redirect_to login_path, notice: 'You are logout!'
  end
end
