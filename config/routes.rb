Rails.application.routes.draw do
  get '/', to: 'home#index'
  get '/register', to: 'home#register'
  post '/register', to: 'home#register_user'
end
