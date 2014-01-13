require 'spec_helper'

describe "parent_questions/show" do
  before(:each) do
    @parent_question = assign(:parent_question, stub_model(ParentQuestion))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
