require 'spec_helper'

describe "completed_checkpoints/index" do
  before(:each) do
    assign(:completed_checkpoints, [
      stub_model(CompletedCheckpoint,
        :checkpoint_id => 1,
        :student_id => 2
      ),
      stub_model(CompletedCheckpoint,
        :checkpoint_id => 1,
        :student_id => 2
      )
    ])
  end

  it "renders a list of completed_checkpoints" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
