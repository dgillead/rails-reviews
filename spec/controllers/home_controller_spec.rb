require_relative '../rails_helper.rb'

describe HomeController do
  render_views

  describe "GET index" do
    let!(:user) { User.create!(name: "Dan", email: "test@codeplatoon.com", password: "abc1234") }

    it "shows a welcome message" do
      sign_in(user)
      get :index

      expect(response.body).to include("Welcome")
    end
  end

  describe "GET /register" do
    it "renders the registration form" do
      get :register

      expect(response.body).to include("Register a New User")
      expect(response.body).to include("Email")
      expect(response.body).to include("Password")
      expect(response.body).to include("Repeat Your Password")
    end
  end

  describe "POST /register" do
    let(:params) do
      { email: "test@codeplatoon.com", password: "abc1234", password_confirmation: "abc1234", name: "Dan" }
    end

    it "creates the new user" do
      expect { post :register_user, params: params }.to change { User.count }.by(1)
    end

    it "redirects to the login page" do
      post :register_user, params: params

      expect(response.status).to eq(302)
      expect(response.location).to include("/login")
    end

    it "includes a nice message when we get to login" do
      post :register_user, params: params

      expect(flash[:success]).to include('Your account was created')
    end

    it "re-renders the form and returns a different status code if there were errors" do
      params['password'] = ''
      params['password_confirmation'] = ''

      expect { post :register, params: params }.not_to change { User.count }

      expect(response.body).to include("Register a New User")
    end
  end

  describe "GET /login" do
    it "renders the login form" do
      get :login

      expect(response.body).to include("Log In")
      expect(response.body).to include("Email")
      expect(response.body).to include("Password")
    end
  end

  describe "POST /login" do
    let!(:user) { User.create!(name: "Dan", email: "test@codeplatoon.com", password: "abc1234") }

   it "persists the user session" do
     sign_in(user)
     params = { email: user.email, password: user.password }

     post :login_user

     expect(response.body).to include("Hello, #{user.name}")
   end

   it "shows the login form again when unsuccessful, with a different status code" do
     user.password = 'not the right password'
     sign_in(user)

     post :login_user

     expect(response.body).to include("Log In")
   end
 end
end
