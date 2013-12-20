require 'spec_helper'

describe "principals/edit" do
  before(:each) do
    @principal = assign(:principal, stub_model(Principal))
  end

  it "renders the edit principal form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", principal_path(@principal), "post" do
    end
  end
end
