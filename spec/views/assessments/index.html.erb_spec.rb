require 'spec_helper'

describe "assessments/index" do
  before(:each) do
    assign(:assessments, [
      stub_model(Assessment),
      stub_model(Assessment)
    ])
  end

  it "renders a list of assessments" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
