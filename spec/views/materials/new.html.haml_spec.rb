require 'rails_helper'

RSpec.describe "materials/new", type: :view do
  before(:each) do
    assign(:material, Material.new(
      :material => "MyString",
      :material_price => "9.99"
    ))
  end

  it "renders new material form" do
    render

    assert_select "form[action=?][method=?]", materials_path, "post" do

      assert_select "input#material_material[name=?]", "material[material]"

      assert_select "input#material_material_price[name=?]", "material[material_price]"
    end
  end
end
