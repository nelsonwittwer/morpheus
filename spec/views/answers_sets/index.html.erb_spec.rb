require 'spec_helper'

describe "answers_sets/index" do
  before(:each) do
    assign(:answers_sets, [
      stub_model(AnswersSet,
        :question_id => 1
      ),
      stub_model(AnswersSet,
        :question_id => 1
      )
    ])
  end

  it "renders a list of answers_sets" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
