require 'spec_helper'

describe "instructional_coaches/index" do
  before(:each) do
    assign(:instructional_coaches, [
      stub_model(InstructionalCoach),
      stub_model(InstructionalCoach)
    ])
  end

  it "renders a list of instructional_coaches" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
