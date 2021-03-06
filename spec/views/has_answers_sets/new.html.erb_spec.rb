require 'spec_helper'

describe "has_answers_sets/new" do
  before(:each) do
    assign(:has_answers_set, stub_model(HasAnswersSet,
      :answers_set_id => "",
      :question_id => 1
    ).as_new_record)
  end

  it "renders new has_answers_set form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", has_answers_sets_path, "post" do
      assert_select "input#has_answers_set_answers_set_id[name=?]", "has_answers_set[answers_set_id]"
      assert_select "input#has_answers_set_question_id[name=?]", "has_answers_set[question_id]"
    end
  end
end
