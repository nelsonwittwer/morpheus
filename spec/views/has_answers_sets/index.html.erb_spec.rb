require 'spec_helper'

describe "has_answers_sets/index" do
  before(:each) do
    assign(:has_answers_sets, [
      stub_model(HasAnswersSet,
        :answers_set_id => "",
        :question_id => 1
      ),
      stub_model(HasAnswersSet,
        :answers_set_id => "",
        :question_id => 1
      )
    ])
  end

  it "renders a list of has_answers_sets" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
