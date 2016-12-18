require 'rails_helper'

RSpec.describe "payments/edit", type: :view do
  before(:each) do
    @payment = assign(:payment, Payment.create!(
      :client_address => "MyString",
      :client_name => "MyString",
      :client_payment => "9.99",
      :client_description => "MyString"
    ))
  end

  it "renders the edit payment form" do
    render

    assert_select "form[action=?][method=?]", payment_path(@payment), "post" do

      assert_select "input#payment_client_address[name=?]", "payment[client_address]"

      assert_select "input#payment_client_name[name=?]", "payment[client_name]"

      assert_select "input#payment_client_payment[name=?]", "payment[client_payment]"

      assert_select "input#payment_client_description[name=?]", "payment[client_description]"
    end
  end
end
