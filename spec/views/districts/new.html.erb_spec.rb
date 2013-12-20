require 'spec_helper'

describe "districts/new" do
  before(:each) do
    assign(:district, stub_model(District).as_new_record)
  end

  it "renders new district form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", districts_path, "post" do
    end
  end
end
