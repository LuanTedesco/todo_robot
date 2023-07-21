require 'rails_helper'

RSpec.describe "sub_tasks/show", type: :view do
  before(:each) do
    assign(:sub_task, SubTask.create!(
      title: "Title"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
  end
end
