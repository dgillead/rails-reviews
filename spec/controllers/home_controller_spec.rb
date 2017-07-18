require_relative '../rails_helper.rb'

describe HomeController do
  render_views

  describe "GET index" do
    it "shows a welcome message" do
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
end
