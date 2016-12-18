require 'rails_helper'

RSpec.describe "materials/edit", type: :view do
  before(:each) do
    @material = assign(:material, Material.create!(
      :material => "MyString",
      :material_price => "9.99"
    ))
  end

  it "renders the edit material form" do
    render

    assert_select "form[action=?][method=?]", material_path(@material), "post" do

      assert_select "input#material_material[name=?]", "material[material]"

      assert_select "input#material_material_price[name=?]", "material[material_price]"
    end
  end
end
