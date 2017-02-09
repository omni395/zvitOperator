require 'rails_helper'

RSpec.describe "expences/index", type: :view do
  before(:each) do
    assign(:expences, [
      Expence.create!(
        :user => nil,
        :expence_description => "Expence Description",
        :expence_cence_value => "9.99"
      ),
      Expence.create!(
        :user => nil,
        :expence_description => "Expence Description",
        :expence_cence_value => "9.99"
      )
    ])
  end

  it "renders a list of expences" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Expence Description".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end
