require 'rails_helper'

RSpec.describe "materials/show", type: :view do
  before(:each) do
    @material = assign(:material, Material.create!(
      :material => "Material",
      :material_price => "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Material/)
    expect(rendered).to match(/9.99/)
  end
end
