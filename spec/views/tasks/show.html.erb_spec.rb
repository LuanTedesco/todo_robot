require 'rails_helper'

RSpec.describe "tasks/show", type: :view do
  before(:each) do
    assign(:task, Task.create!(
      tittle: "Tittle",
      description: "Description",
      result: "Result",
      finished: false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Tittle/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/Result/)
    expect(rendered).to match(/false/)
  end
end
