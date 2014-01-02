require 'spec_helper'

describe "completed_checkpoints/show" do
  before(:each) do
    @completed_checkpoint = assign(:completed_checkpoint, stub_model(CompletedCheckpoint,
      :checkpoint_id => 1,
      :student_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
  end
end
