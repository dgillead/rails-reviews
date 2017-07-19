class HomeController < ApplicationController
  def index
  end

  def register
    user = User.new
    render :register, locals: { user: user }
  end

  def register_user
    user = User.new(registration_params)

    if user.save
      flash[:success] = "Your account was created successfully! Please log in."
      redirect_to "/login"
    else
      render :register, locals: { user: user }
    end
  end

  def login
  end

  def login_user
    user = User.find_by(email: params[:email]).try(:authenticate, params[:password])
    if user
      session[:user_id] = user.id
      redirect_to '/'
    else
      render :login
    end
  end

  def logout
    session.clear
    redirect_to '/login'
  end

  private

  def registration_params
    params.permit(:name, :email, :password, :password_confirmation)
  end
end
