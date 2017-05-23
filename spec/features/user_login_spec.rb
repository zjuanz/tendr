RSpec.feature "User Login", type: :feature do
  # since registration isn't working we need to create user
  args = {
    user_name: "tester",
    zipcode: "78703",
    email: "tester@hello.com",
    password: "password"
  }
  User.create(args)
  scenario "As a user, I can login" do
     visit "/welcome/index"
    expect(page).to have_link("Login")
    click_on("Login")
    expect(page).to have_content("Email")
    fill_in("Email", :with => "tester@hello.com")
    expect(find_field("Email").value).to eq "tester@hello.com"
    expect(page).to have_content("Password")
    fill_in("Password", :with => "password")
    expect(find_field("Password").value).to eq "password"
    click_button 'Log in'
    # save_and_open_page
    expect(page).to have_content("Welcome back to Tendr")
    expect(page.current_path).to eq ("/decks/show")
  end
  scenario "As a user, I want to start swiping after logging in, or the last food I clicked 'take me' on." do
      visit "/welcome/index"
      click_on("Login")
      fill_in("Email", :with => "tester@hello.com")
      fill_in("Password", :with => "password")
      click_button 'Log in'

      expect(page.current_path).to eq ("/decks/show")
  end
  xscenario "As a user, I will be asked if I liked/ate at the last 'take me'" do

  end
end
