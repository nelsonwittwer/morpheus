require 'spec_helper'

describe "principals/new" do
  before(:each) do
    assign(:principal, stub_model(Principal).as_new_record)
  end

  it "renders new principal form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", principals_path, "post" do
    end
  end
end
