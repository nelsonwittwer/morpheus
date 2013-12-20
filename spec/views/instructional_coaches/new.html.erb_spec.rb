require 'spec_helper'

describe "instructional_coaches/new" do
  before(:each) do
    assign(:instructional_coach, stub_model(InstructionalCoach).as_new_record)
  end

  it "renders new instructional_coach form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", instructional_coaches_path, "post" do
    end
  end
end
