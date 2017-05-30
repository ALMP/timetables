require 'rails_helper'

RSpec.describe "employees/index", :type => :view do
  before(:each) do
    assign(:employees, [
      Employee.create!(
        :name => "Name",
        :code => "Code"
      ),
      Employee.create!(
        :name => "Name",
        :code => "Code"
      )
    ])
  end

  it "renders a list of employees" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Code".to_s, :count => 2
  end
end
