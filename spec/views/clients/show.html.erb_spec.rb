require 'spec_helper'

describe "clients/show.html.erb" do
  before(:each) do
    @client = assign(:client, stub_model(Client,
      :first_name => "First Name",
      :last_name => "Last Name",
      :middle_name => "Middle Name",
      :gender => "Gender",
      :ethnicity => "Ethnicity",
      :unique_id => "Unique"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/First Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Last Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Middle Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Gender/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Ethnicity/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Unique/)
  end
end
