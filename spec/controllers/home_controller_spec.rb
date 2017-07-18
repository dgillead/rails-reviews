require_relative '../rails_helper.rb'

describe HomeController do
  render_views

  describe "GET index" do
    it "shows a welcome message" do
      get :index

      expect(response.body).to include("Welcome")
    end
  end
end
