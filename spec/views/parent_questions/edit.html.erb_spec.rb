require 'spec_helper'

describe "parent_questions/edit" do
  before(:each) do
    @parent_question = assign(:parent_question, stub_model(ParentQuestion))
  end

  it "renders the edit parent_question form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", parent_question_path(@parent_question), "post" do
    end
  end
end
