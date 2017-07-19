Rails.application.routes.draw do
  get '/', to: 'home#index'
  get '/register', to: 'home#register'
  get '/login', to: 'home#login'
  get '/logout', to: 'home#logout'

  post '/register', to: 'home#register_user'
  post '/login', to: 'home#login_user'
end
