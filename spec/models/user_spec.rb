require_relative '../rails_helper'

RSpec.describe User do
  describe "password requirements" do
    it "requires a password to be present" do
      user = User.new(email: "test@codeplatoon.com", password: "", password_confirmation: "", name: "Dan")

      expect(user).not_to be_valid
    end

    it "expects passwords to match" do
      user = User.new(email: "test@codeplatoon.com", password: "abc1234", password_confirmation: "abc12", name: "Dan")

      expect(user).not_to be_valid
    end

    it "encrypts that password" do
      user = User.new(email: "test@codeplatoon.com", password: "abc1234", password_confirmation: "abc1234", name: "Dan")
      user.save

      # $2a$10$05PNQidzkovzrQbi9lRZ8O7sps.mHJzY.cIvsQUaqAhg2b2sSD3qK is what I got
      expect(user.password_digest).not_to eq("abc1234")
    end
  end
end
