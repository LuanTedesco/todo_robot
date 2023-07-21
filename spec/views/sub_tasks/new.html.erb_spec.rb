require 'rails_helper'

RSpec.describe "sub_tasks/new", type: :view do
  before(:each) do
    assign(:sub_task, SubTask.new(
      title: "MyString"
    ))
  end

  it "renders new sub_task form" do
    render

    assert_select "form[action=?][method=?]", sub_tasks_path, "post" do

      assert_select "input[name=?]", "sub_task[title]"
    end
  end
end
