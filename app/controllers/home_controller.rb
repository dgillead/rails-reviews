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

  private

  def registration_params
    params.permit(:name, :email, :password, :password_confirmation)
  end
end
