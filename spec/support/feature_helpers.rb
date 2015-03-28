module FeatureHelpers

  def login(user, password = "password")
    visit root_path
    fill_in "Email", with: user.email
    fill_in "Password", with: password
    click_on "Login"
  end
end