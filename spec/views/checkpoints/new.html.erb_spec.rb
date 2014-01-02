require 'spec_helper'

describe "checkpoints/new" do
  before(:each) do
    assign(:checkpoint, stub_model(Checkpoint,
      :student_id => 1,
      :type => ""
    ).as_new_record)
  end

  it "renders new checkpoint form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", checkpoints_path, "post" do
      assert_select "input#checkpoint_student_id[name=?]", "checkpoint[student_id]"
      assert_select "input#checkpoint_type[name=?]", "checkpoint[type]"
    end
  end
end
