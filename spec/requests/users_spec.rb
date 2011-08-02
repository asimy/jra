require 'spec_helper'

describe "Users" do
  
  describe "register" do
    
    describe "failure" do
      it "should not make a new user" do
        lambda do
          visit register_path
          fill_in "First Name",     :with => ''
          fill_in "Last Name",      :with => ''
          fill_in "Email",          :with => ''
          fill_in "Password",       :with => ''
          fill_in "Confirmation",   :with => ''
          click_button
          response.should render_template('users/new')
          response.should have_selector('div#error_explanation')
        end.should_not change(User, :count)
      end
      
      it "should clear the password field" do
        visit register_path
        fill_in "First Name",     :with => ''
        fill_in "Last Name",      :with => ''
        fill_in "Email",          :with => ''
        fill_in "Password",       :with => 'foobar'
        fill_in "Confirmation",   :with => 'foobar'        
        response.should have_selector("input[name='user[password]'][type='password']", :content => '')
      end
    end
    
    describe "success" do
      it "should make a new user" do
        lambda do
          visit register_path
          fill_in "First Name",     :with => 'Test'
          fill_in "Last Name",      :with => 'Averde'
          fill_in "Email",          :with => 'irony@example.com'
          fill_in "Password",       :with => 'snafudo'
          fill_in "Confirmation",   :with => 'snafudo'
          click_button
          response.should have_selector('div.flash.success', :content => "Welcome")
          response.should render_template('users/show')
        end.should change(User, :count).by(1)
      end
    end
  end
end
