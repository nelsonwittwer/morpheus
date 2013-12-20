require 'spec_helper'

describe "principals/show" do
  before(:each) do
    @principal = assign(:principal, stub_model(Principal))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
