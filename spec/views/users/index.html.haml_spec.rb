require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, [
      User.create!(
        :index => "Index",
        :show => "Show"
      ),
      User.create!(
        :index => "Index",
        :show => "Show"
      )
    ])
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", :text => "Index".to_s, :count => 2
    assert_select "tr>td", :text => "Show".to_s, :count => 2
  end
end
