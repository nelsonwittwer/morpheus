require 'spec_helper'

describe "checkpoints/index" do
  before(:each) do
    assign(:checkpoints, [
      stub_model(Checkpoint,
        :student_id => 1,
        :type => "Type"
      ),
      stub_model(Checkpoint,
        :student_id => 1,
        :type => "Type"
      )
    ])
  end

  it "renders a list of checkpoints" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Type".to_s, :count => 2
  end
end
