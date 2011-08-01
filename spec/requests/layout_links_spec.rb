require 'spec_helper'

describe "LayoutLinks" do
  
  it "should have a home page at '/'" do 
    get '/'
    response.should have_selector('title', :content => "Juvenile Risk Assessment | Home")
  end
  
  it "should have an about page at '/about'" do 
    get '/about'
    response.should have_selector('title', :content => "Juvenile Risk Assessment | About")
  end
  
  it "should have a help page at '/help'" do 
    get '/help'
    response.should have_selector('title', :content => "Juvenile Risk Assessment | Help")
  end
  
  it "should have a home page at '/contact'" do 
    get '/contact'
    response.should have_selector('title', :content => "Juvenile Risk Assessment | Contact")
  end
  
  it "should have a registration pages at '/register'" do
    get '/register'
    response.should have_selector('title', :content => "Juvenile Risk Assessment | Register")
  end
end
