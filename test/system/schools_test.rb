require "application_system_test_case"

class SchoolsTest < ApplicationSystemTestCase
  setup do
    @school = schools(:one)
  end

  test "visiting the index" do
    visit schools_url
    assert_selector "h1", text: "Schools"
  end

  test "creating a School" do
    visit schools_url
    click_on "New School"

    fill_in "Contact name", with: @school.contact_name
    fill_in "Email", with: @school.email
    fill_in "Mobile", with: @school.mobile
    fill_in "Name", with: @school.name
    fill_in "Phone", with: @school.phone
    click_on "Create School"

    assert_text "School was successfully created"
    click_on "Back"
  end

  test "updating a School" do
    visit schools_url
    click_on "Edit", match: :first

    fill_in "Contact name", with: @school.contact_name
    fill_in "Email", with: @school.email
    fill_in "Mobile", with: @school.mobile
    fill_in "Name", with: @school.name
    fill_in "Phone", with: @school.phone
    click_on "Update School"

    assert_text "School was successfully updated"
    click_on "Back"
  end

  test "destroying a School" do
    visit schools_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "School was successfully destroyed"
  end
end
