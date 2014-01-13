require 'spec_helper'

describe "parent_questions/new" do
  before(:each) do
    assign(:parent_question, stub_model(ParentQuestion).as_new_record)
  end

  it "renders new parent_question form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", parent_questions_path, "post" do
    end
  end
end
