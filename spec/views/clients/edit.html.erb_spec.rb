require 'spec_helper'

describe "clients/edit.html.erb" do
  before(:each) do
    @client = assign(:client, stub_model(Client,
      :first_name => "MyString",
      :last_name => "MyString",
      :middle_name => "MyString",
      :gender => "MyString",
      :ethnicity => "MyString",
      :unique_id => "MyString"
    ))
  end

  it "renders the edit client form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => clients_path(@client), :method => "post" do
      assert_select "input#client_first_name", :name => "client[first_name]"
      assert_select "input#client_last_name", :name => "client[last_name]"
      assert_select "input#client_middle_name", :name => "client[middle_name]"
      assert_select "input#client_gender", :name => "client[gender]"
      assert_select "input#client_ethnicity", :name => "client[ethnicity]"
      assert_select "input#client_unique_id", :name => "client[unique_id]"
    end
  end
end
