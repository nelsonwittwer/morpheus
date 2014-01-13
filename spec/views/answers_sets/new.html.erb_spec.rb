require 'spec_helper'

describe "answers_sets/new" do
  before(:each) do
    assign(:answers_set, stub_model(AnswersSet,
      :question_id => 1
    ).as_new_record)
  end

  it "renders new answers_set form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", answers_sets_path, "post" do
      assert_select "input#answers_set_question_id[name=?]", "answers_set[question_id]"
    end
  end
end
