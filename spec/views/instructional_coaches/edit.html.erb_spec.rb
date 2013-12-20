require 'spec_helper'

describe "instructional_coaches/edit" do
  before(:each) do
    @instructional_coach = assign(:instructional_coach, stub_model(InstructionalCoach))
  end

  it "renders the edit instructional_coach form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", instructional_coach_path(@instructional_coach), "post" do
    end
  end
end
