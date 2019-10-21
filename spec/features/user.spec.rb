require 'rails_helper'

RSpec.feature "Task management function", type: :feature do
  background do
    User.create!(name:'peter', email: 'peter@gmail.Com',  password: '123456')
    User.create!(name:'john', email: 'john@gmail.Com',  password: '123456')
    visit  root_path
    fill_in  'Email' ,  with: 'peter@gmail.Com'
    fill_in  'Password' ,  with: '123456'
    click_on  'Log in'
    expect(page ).to have_text('Tasks')
  end
  scenario "Test user list" do

    expect(page).to have_content 'peter'
    
    visit users_path
    save_and_open_page

  end
  scenario "Test number of users" do
    
    User.create!(name: 'paul', email: 'paul@gmail.com', user_type: 'admin', password: '123456')
    @user = User.all.count
    expect(@user).to eq 3
  end

  scenario "Test user creation" do
    User.create!(name: 'petro', email: 'petro@gmail.com', user_type: 'admin', password: '123456')
    visit admin_users_path
  end

  scenario "Test user details" do
    @user= User.create!(name: 'petro', email: 'petro@gmail.com', user_type: 'admin', password: '123456')
    visit admin_user_path(id: @user.id)
    expect(page).to have_content('petro@gmail.com')
    expect(page).to have_content('admin')
  end
  scenario "Test user updating" do
    @user = User.first
    visit edit_admin_user_path(id: @user.id)
    fill_in 'Email', with: 'petro@gmail.com'
    click_on '更新する'
    
    visit admin_users_path
  end
  scenario 'Test user Deletion' do
    User.create!(name: 'petro', email: 'petro@gmail.com', user_type: 'admin', password: '123456')
    @user = User.last
    @user.destroy
    visit users_path
    expect(page).not_to have_content('petro')
  end
end