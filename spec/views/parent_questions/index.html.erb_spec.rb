require 'spec_helper'

describe "parent_questions/index" do
  before(:each) do
    assign(:parent_questions, [
      stub_model(ParentQuestion),
      stub_model(ParentQuestion)
    ])
  end

  it "renders a list of parent_questions" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
