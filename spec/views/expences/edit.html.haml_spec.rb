require 'rails_helper'

RSpec.describe "expences/edit", type: :view do
  before(:each) do
    @expence = assign(:expence, Expence.create!(
      :user => nil,
      :expence_description => "MyString",
      :expence_cence_value => "9.99"
    ))
  end

  it "renders the edit expence form" do
    render

    assert_select "form[action=?][method=?]", expence_path(@expence), "post" do

      assert_select "input#expence_user_id[name=?]", "expence[user_id]"

      assert_select "input#expence_expence_description[name=?]", "expence[expence_description]"

      assert_select "input#expence_expence_cence_value[name=?]", "expence[expence_cence_value]"
    end
  end
end
