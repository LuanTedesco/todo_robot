require 'rails_helper'

RSpec.describe "priorities/edit", type: :view do
  let(:priority) {
    Priority.create!(
      name: "MyString",
      position: 1
    )
  }

  before(:each) do
    assign(:priority, priority)
  end

  it "renders the edit priority form" do
    render

    assert_select "form[action=?][method=?]", priority_path(priority), "post" do

      assert_select "input[name=?]", "priority[name]"

      assert_select "input[name=?]", "priority[position]"
    end
  end
end
