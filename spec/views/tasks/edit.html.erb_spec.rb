require 'rails_helper'

RSpec.describe "tasks/edit", type: :view do
  let(:task) {
    Task.create!(
      tittle: "MyString",
      description: "MyString",
      result: "MyString",
      finished: false
    )
  }

  before(:each) do
    assign(:task, task)
  end

  it "renders the edit task form" do
    render

    assert_select "form[action=?][method=?]", task_path(task), "post" do

      assert_select "input[name=?]", "task[tittle]"

      assert_select "input[name=?]", "task[description]"

      assert_select "input[name=?]", "task[result]"

      assert_select "input[name=?]", "task[finished]"
    end
  end
end
