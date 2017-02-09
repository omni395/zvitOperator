require 'rails_helper'

RSpec.describe "expences/show", type: :view do
  before(:each) do
    @expence = assign(:expence, Expence.create!(
      :user => nil,
      :expence_description => "Expence Description",
      :expence_cence_value => "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Expence Description/)
    expect(rendered).to match(/9.99/)
  end
end
