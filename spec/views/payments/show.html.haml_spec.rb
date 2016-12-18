require 'rails_helper'

RSpec.describe "payments/show", type: :view do
  before(:each) do
    @payment = assign(:payment, Payment.create!(
      :client_address => "Client Address",
      :client_name => "Client Name",
      :client_payment => "9.99",
      :client_description => "Client Description"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Client Address/)
    expect(rendered).to match(/Client Name/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/Client Description/)
  end
end
