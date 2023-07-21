require 'rails_helper'

RSpec.describe "sub_tasks/index", type: :view do
  before(:each) do
    assign(:sub_tasks, [
      SubTask.create!(
        title: "Title"
      ),
      SubTask.create!(
        title: "Title"
      )
    ])
  end

  it "renders a list of sub_tasks" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Title".to_s), count: 2
  end
end
