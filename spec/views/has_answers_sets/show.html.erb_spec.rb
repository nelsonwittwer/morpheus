require 'spec_helper'

describe "has_answers_sets/show" do
  before(:each) do
    @has_answers_set = assign(:has_answers_set, stub_model(HasAnswersSet,
      :answers_set_id => "",
      :question_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(/1/)
  end
end
