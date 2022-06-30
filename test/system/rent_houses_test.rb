require "application_system_test_case"

class RentHousesTest < ApplicationSystemTestCase
  setup do
    @rent_house = rent_houses(:one)
  end

  test "visiting the index" do
    visit rent_houses_url
    assert_selector "h1", text: "Rent Houses"
  end

  test "creating a Rent house" do
    visit rent_houses_url
    click_on "New Rent House"

    fill_in "Address", with: @rent_house.address
    fill_in "Age", with: @rent_house.age
    fill_in "House name", with: @rent_house.house_name
    fill_in "Remaks", with: @rent_house.remaks
    fill_in "Rent", with: @rent_house.rent
    click_on "Create Rent house"

    assert_text "Rent house was successfully created"
    click_on "Back"
  end

  test "updating a Rent house" do
    visit rent_houses_url
    click_on "Edit", match: :first

    fill_in "Address", with: @rent_house.address
    fill_in "Age", with: @rent_house.age
    fill_in "House name", with: @rent_house.house_name
    fill_in "Remaks", with: @rent_house.remaks
    fill_in "Rent", with: @rent_house.rent
    click_on "Update Rent house"

    assert_text "Rent house was successfully updated"
    click_on "Back"
  end

  test "destroying a Rent house" do
    visit rent_houses_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Rent house was successfully destroyed"
  end
end
