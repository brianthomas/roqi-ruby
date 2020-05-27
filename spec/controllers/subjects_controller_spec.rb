require 'spec_helper'

describe SubjectsController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET '1'" do
    it "returns http success" do
      get 'show'
      response.should be_success
    end
  end

end
