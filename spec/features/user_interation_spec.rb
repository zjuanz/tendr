RSpec.feature "User Interaction", type: :feature do
  xscenario "As a user, I want to be able to filter food categories/location" do
  end
  xscenario "As a user, I can edit my user profile" do
      visit "/welcome/index"
      click_on("Login")
      fill_in("Email", :with => "tester@hello.com")
      fill_in("Password", :with => "password")
      click_button 'Log in'

      expect(page.current_path).to eq ("/decks/show")
      expect(page).to have_link("Tester")
      click_link("Tester")
      expect(page).to have_content("Hey there, Tester")
      expect(page).to have_link("Edit Profile")
      click_link("Edit Profile")
      expect(page).to have_content("Email")
      fill_in("Email", :with => "tester2@hello.com")
      expect(find_field("Email").value).to eq "tester2@hello.com"
      # save_and_open_page
      expect(page).to have_link("Update")
      click_link("Update")
  end
  xscenario "As a user, I can see my history" do
     visit "/welcome/index"
      click_on("Login")
      fill_in("Email", :with => "tester@hello.com")
      fill_in("Password", :with => "password")
      click_button 'Log in'

      expect(page.current_path).to eq ("/decks/show")
      expect(page).to have_link("Tester")
      click_link("Tester")
      expect(page).to have_content("Here Are Your Favorites")
  end
  xscenario "As a user, I swipe left and I move to next food item" do
    visit "/welcome/index"
      click_on("Login")
      fill_in("Email", :with => "tester@hello.com")
      fill_in("Password", :with => "password")
      click_button 'Log in'

      expect(page.current_path).to eq ("/decks/show")
      expect(page).to have_css('i.fa-times')
      save_and_open_page
      find(:css,'i.fa-times').click
      save_and_open_page
  end
  xscenario "As a user, I swipe right and that add the restaurant to the 'liked' list" do

  end
  scenario "As a user, I click the image/button and it gives me restaurant details" do
     visit "/welcome/index"
      click_on("Login")
      fill_in("Email", :with => "tester@hello.com")
      fill_in("Password", :with => "password")
      click_button 'Log in'

      expect(page.current_path).to eq ("/decks/show")
      expect(page).to have_link("Show me more")
      click_link("Show me more")
      expect(page).to have_content("Here Are Your Favorites")

  end
  xscenario "As a user, I click on the 'take me', and it will ask if I ate that food next time I login." do
  end
  xscenario "As a user, I click on the 'favorites' and it takes me to the favorite list." do
  end
  xscenario "As a user, I click on an item in the favorites list, and it takes me to the restaurant details" do
  end

end
