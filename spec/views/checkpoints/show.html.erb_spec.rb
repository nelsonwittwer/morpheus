require 'spec_helper'

describe "checkpoints/show" do
  before(:each) do
    @checkpoint = assign(:checkpoint, stub_model(Checkpoint,
      :student_id => 1,
      :type => "Type"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/Type/)
  end
end
