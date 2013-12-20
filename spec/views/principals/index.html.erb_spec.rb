require 'spec_helper'

describe "principals/index" do
  before(:each) do
    assign(:principals, [
      stub_model(Principal),
      stub_model(Principal)
    ])
  end

  it "renders a list of principals" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
