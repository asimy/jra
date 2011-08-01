require 'spec_helper'

describe UsersController do
  render_views
  
  describe "Get 'new'" do
    it "should be successful" do
      get 'new'
      response.should be_success
    end
  
    it "should have the right title" do
      get 'new'
      response.should have_selector('title',:content => 'Juvenile Risk Assessment | Register')
    end
  end
  
end