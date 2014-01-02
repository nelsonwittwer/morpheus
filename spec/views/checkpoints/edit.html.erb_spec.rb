require 'spec_helper'

describe "checkpoints/edit" do
  before(:each) do
    @checkpoint = assign(:checkpoint, stub_model(Checkpoint,
      :student_id => 1,
      :type => ""
    ))
  end

  it "renders the edit checkpoint form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", checkpoint_path(@checkpoint), "post" do
      assert_select "input#checkpoint_student_id[name=?]", "checkpoint[student_id]"
      assert_select "input#checkpoint_type[name=?]", "checkpoint[type]"
    end
  end
end
