require 'spec_helper'

describe "completed_checkpoints/edit" do
  before(:each) do
    @completed_checkpoint = assign(:completed_checkpoint, stub_model(CompletedCheckpoint,
      :checkpoint_id => 1,
      :student_id => 1
    ))
  end

  it "renders the edit completed_checkpoint form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", completed_checkpoint_path(@completed_checkpoint), "post" do
      assert_select "input#completed_checkpoint_checkpoint_id[name=?]", "completed_checkpoint[checkpoint_id]"
      assert_select "input#completed_checkpoint_student_id[name=?]", "completed_checkpoint[student_id]"
    end
  end
end
