require 'rails_helper'

RSpec.describe "sub_tasks/edit", type: :view do
  let(:sub_task) {
    SubTask.create!(
      title: "MyString"
    )
  }

  before(:each) do
    assign(:sub_task, sub_task)
  end

  it "renders the edit sub_task form" do
    render

    assert_select "form[action=?][method=?]", sub_task_path(sub_task), "post" do

      assert_select "input[name=?]", "sub_task[title]"
    end
  end
end
