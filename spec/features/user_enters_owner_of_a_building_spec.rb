require 'spec_helper'

describe 'a user add an owner' do

  # ACCEPTANCE CRITERIA
  # I can comment on a menu item from the menu item show page
  # I cannot create blank comments

  context "when given valid attributes" do
    it 'does create a new owner' do

      visit new_owner_path
      fill_in "First Name", with: 'Mike'
      fill_in "Last Name", with: 'Swanson'
      fill_in "Email", with: 'Mikeswanson12@msn.com'
      click_on "Add Owner"

      expect(page).to have_content "The owner was created successfully."
    end
  end

  context "when given invalid attributes" do
    it 'does not create an owner' do

      visit new_owner_path

      click_on "Add Owner"

      expect(page).to have_content "Email can't be blank"
      expect(page).to have_content "First name can't be blank"
      expect(page).to have_content "Last name can't be blank"
    end
  end

end
