require 'spec_helper'

describe "answers_sets/show" do
  before(:each) do
    @answers_set = assign(:answers_set, stub_model(AnswersSet,
      :question_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
