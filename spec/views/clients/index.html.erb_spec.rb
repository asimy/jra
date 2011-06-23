require 'spec_helper'

describe "clients/index.html.erb" do
  before(:each) do
    assign(:clients, [
      stub_model(Client,
        :first_name => "First Name",
        :last_name => "Last Name",
        :middle_name => "Middle Name",
        :gender => "Gender",
        :ethnicity => "Ethnicity",
        :unique_id => "Unique"
      ),
      stub_model(Client,
        :first_name => "First Name",
        :last_name => "Last Name",
        :middle_name => "Middle Name",
        :gender => "Gender",
        :ethnicity => "Ethnicity",
        :unique_id => "Unique"
      )
    ])
  end

  it "renders a list of clients" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Middle Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Gender".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Ethnicity".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Unique".to_s, :count => 2
  end
end
