class HomeController < ApplicationController
  def index
  end

  def register
    user = User.new
    render :register, locals: { user: user }
  end
end
