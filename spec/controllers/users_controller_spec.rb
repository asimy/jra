require 'spec_helper'

describe UsersController do
  render_views

  before(:each) do
    @base_title = "Juvenile Risk Assessment | "
  end

  describe "GET 'show'" do
    before(:each) do
      @user = Factory(:user)
    end

    it "should be successful" do
      get :show, :id => @user
      response.should be_success
    end

    it "should find the right user" do
      get :show, :id => @user
      assigns(:user).should == @user
    end

    it "should have the right title" do
      get :show, :id => @user
      response.should have_selector('title', :content => @user.name)
    end

    it "should include the user's name" do
      get :show, :id => @user
      response.should have_selector('h1', :content => @user.name)
    end

    it "should have a profile image" do
      get :show, :id => @user
      response.should have_selector('h1>img', :class => 'gravatar')
    end
  end

  describe "Get 'new'" do
    it "should be successful" do
      get :new
      response.should be_success
    end

    it "should have the right title" do
      get :new
      response.should have_selector('title',:content => "#{@base_title}Register")
    end
    
    it "should have a first name field" do
      get :new
      response.should have_selector("input[name='user[first_name]'][type='text']")
    end
    
    it "should have a last name field" do
      get :new
      response.should have_selector("input[name='user[last_name]'][type='text']")
    end
    
    it "should have an email field" do
      get :new
      response.should have_selector("input[name='user[email]'][type='text']")
    end
    
    it "should have a password field" do
      get :new
      response.should have_selector("input[name='user[password]'][type='password']")
    end

    it "should have a password confirmation field" do
      get :new
      response.should have_selector("input[name='user[password_confirmation]'][type='password']")
    end
  end

  describe "POST 'create'" do
    before(:each) do
      @attr = { :first_name => '', :last_name => '', :email => '', :password => '',
        :password_confirmation => ''}
      end

      it "should not create a user" do
        lambda do
          post :create, :user => @attr
        end.should_not change(User, :count)
      end

      it "should have the right title" do
        post:create, :user => @attr
        response.should have_selector("title", :content => "#{@base_title}Register")
      end

      it "should render the 'new' page" do
        post :create, :user => @attr
        response.should render_template('new')
      end

      describe "success" do

        before(:each) do
          @attr = { :first_name => "New", :last_name => "User", :email => "user@example.com",
            :password => "foobar", :password_confirmation => "foobar" }
          end

          it "should create a user" do
            lambda do
              post :create, :user => @attr
            end.should change(User, :count).by(1)
          end

          it "should redirect to the user show page" do
            post :create, :user => @attr
            response.should redirect_to(user_path(assigns(:user)))
          end
          
          it "should have a welcome message" do
            post :create, :user => @attr
            flash[:success].should =~ /welcome to the juvenile risk assessment/i
          end
        end
      end
    end
