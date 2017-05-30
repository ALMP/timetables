require "rails_helper"

RSpec.feature "Creating Employees" do
 scenario "A user creates a new employee" do
  visit "/employees"
  click_link "New Employee"
  fill_in "Name", with: "Antonio Delli Carpini"
  fill_in "Code", with: "ADC_01"
  fill_in "Password", with: "pluto"
  
  click_button "Create Employee"

  expect(page).to have_content("Employee was successfully created")
  expect(page.current_path).to eq(employee_path(Employee.last))
 end
 
 scenario "A user fails to creates a new employee" do
  visit "/employees"
  click_link "New Employee"
  fill_in "Name", with: ""
  fill_in "Code", with: ""
  fill_in "Password", with: ""

  click_button "Create Employee"
  
  expect(page).to have_content("Employee has not been created")
  expect(page).to have_content("Name can't be blank")
  expect(page).to have_content("Code can't be blank")

 end
end
