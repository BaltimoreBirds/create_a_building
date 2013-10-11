require'spec_helper'

feature'User creates a new building record', %Q{
  As a real estate associate
  I want to record a building
  So that I can refer back to pertinent information

  Acceptance Criteria:
  I must specify a street address, city, state, and postal code
  Only US states can be specified
  I can optionally specify a description of the building
  If I enter all of the required information in the required format, the building is recorded.
  If I do not specify all of the required information in the required formats, the building is not recorded and I am presented with errors
  Upon successfully creating a building, I am redirected so that I can record another building.
} do


  it'user enter valid information'do
    FactoryGirl.create(:building)
    prev_count = Building.count

    visit new_building_path
    expect(page).to have_content("Enter a new building record")

    fill_in 'Street Address', with: "Buckstone Court"
    fill_in 'City', with: 'Columbia'
    fill_in 'State', with: 'Maryland'
    fill_in 'Postal Code', with: '21044'
    fill_in 'Building Description', with: "Really beautiful yard."

    click_button "Enter new building record"

    expect(page).to have_content("You have successfully entered a new building record")
    expect(page).to have_content("Enter a new building record")
    expect(Building.count).to eql(prev_count+1)
  end

    it'user enter valid information'do

    prev_count = Building.count

    visit new_building_path
    expect(page).to have_content("Enter a new building record")

    click_button "Enter new building record"
    expect(page).to have_content("can't be blank")
    expect(page).to have_content("Enter a new building record")
    expect(Building.count).to eql(prev_count)

  end

  context "specifies an associated building" do
    it 'associates the building with an owner' do
      owner = FactoryGirl.create(:owner, last_name: "Johnson")
      name = owner.last_name

binding.pry
    visit new_building_path
    fill_in 'Street Address', with: "Buckstone Court"
    fill_in 'City', with: 'Columbia'
    fill_in 'State', with: 'Maryland'
    fill_in 'Postal Code', with: '21044'
    fill_in 'Building Description', with: "Really beautiful yard."
    select name, from: 'Owner'
    binding.pry
    click_on "Enter new building record"

    expect(page).to have_content("You have successfully entered a new building record")
    expect(Building.last.owner).to_not be_nil

    end
  end

end
