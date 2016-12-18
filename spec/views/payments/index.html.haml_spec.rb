require 'rails_helper'

RSpec.describe "payments/index", type: :view do
  before(:each) do
    assign(:payments, [
      Payment.create!(
        :client_address => "Client Address",
        :client_name => "Client Name",
        :client_payment => "9.99",
        :client_description => "Client Description"
      ),
      Payment.create!(
        :client_address => "Client Address",
        :client_name => "Client Name",
        :client_payment => "9.99",
        :client_description => "Client Description"
      )
    ])
  end

  it "renders a list of payments" do
    render
    assert_select "tr>td", :text => "Client Address".to_s, :count => 2
    assert_select "tr>td", :text => "Client Name".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "Client Description".to_s, :count => 2
  end
end
