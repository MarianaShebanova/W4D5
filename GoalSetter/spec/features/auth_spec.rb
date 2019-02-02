require 'spec_helper'
require 'rails_helper'

RSpec.feature "Auths", type: :feature do
  # pending "add some scenarios (or delete) #{__FILE__}"
  feature 'the signup process' do
    background :each do
    visit new_user_path
    end

  scenario 'has a new user page' do
    expect(page).to have_content('Username')
    expect(page).to have_content('Password')
  end

  feature 'signing up a user' do
    background :each do
    visit new_user_path
    end

    scenario 'shows username on the homepage after signup' do 
      expect(page).to have_content('Username')
    end 
  end
end
  feature 'logging in' do
    background :each do
    visit new_user_path
    end
    scenario 'shows username on the homepage after login' do
      expect(page).to have_content('Username')
    end

  end
 
  feature 'logging out' do
    background :each do
    visit new_user_path
    end
     
 
    scenario 'begins with a logged out state' do
     expect(page).to have_content('Password')
    end 

    scenario 'doesn\'t show username on the homepage after logout' do 
      user = User.create(username: "fred", password: "123456")
      session[:session_token] = user.reset_session_token!
      logged_in = User.find_by(session[:session_token])
      session[:session_token] = nil

      expect(page).not_to have_content(logged_in.username)
    end 
  end
end
