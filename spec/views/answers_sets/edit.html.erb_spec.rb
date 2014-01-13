require 'spec_helper'

describe "answers_sets/edit" do
  before(:each) do
    @answers_set = assign(:answers_set, stub_model(AnswersSet,
      :question_id => 1
    ))
  end

  it "renders the edit answers_set form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", answers_set_path(@answers_set), "post" do
      assert_select "input#answers_set_question_id[name=?]", "answers_set[question_id]"
    end
  end
end
