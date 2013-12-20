require 'spec_helper'

describe "assessments/new" do
  before(:each) do
    assign(:assessment, stub_model(Assessment).as_new_record)
  end

  it "renders new assessment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", assessments_path, "post" do
    end
  end
end
