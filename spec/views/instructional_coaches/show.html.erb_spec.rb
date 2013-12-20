require 'spec_helper'

describe "instructional_coaches/show" do
  before(:each) do
    @instructional_coach = assign(:instructional_coach, stub_model(InstructionalCoach))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
