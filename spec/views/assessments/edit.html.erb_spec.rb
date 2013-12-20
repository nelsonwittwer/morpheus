require 'spec_helper'

describe "assessments/edit" do
  before(:each) do
    @assessment = assign(:assessment, stub_model(Assessment))
  end

  it "renders the edit assessment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", assessment_path(@assessment), "post" do
    end
  end
end
