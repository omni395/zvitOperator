require 'rails_helper'

RSpec.describe "materials/index", type: :view do
  before(:each) do
    assign(:materials, [
      Material.create!(
        :material => "Material",
        :material_price => "9.99"
      ),
      Material.create!(
        :material => "Material",
        :material_price => "9.99"
      )
    ])
  end

  it "renders a list of materials" do
    render
    assert_select "tr>td", :text => "Material".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end
