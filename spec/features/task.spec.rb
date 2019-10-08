require 'rails_helper'

RSpec.feature "Task management function", type: :feature do
  background do
    User.create!(name:'peter', email: 'peter@gmail.Com',  password: '123456')
    visit  root_path
    fill_in  'Email' ,  with: 'peter@gmail.Com'
    fill_in  'Password' ,  with: '123456'
    click_on  'Log in'
    expect(page ).to have_text('Tasks')
    click_on 'Atarashī shigoto'
       fill_in  'Name' ,  with: 'confort'
       fill_in  'Details' ,  with: 'testconfort zone'
       click_on '登録する'
       click_on 'Bakku'
       click_on 'Atarashī shigoto'
       fill_in  'Name' ,  with: 'W.H.O'
       fill_in  'Details' ,  with: 'World Health Progrm'
       click_on '登録する'
       click_on 'Bakku'
    #FactoryBot.create(:task, name: 'Added name 1')
    Task.create(name: 'cooking', details: 'porridge',status: 'completed',priority:'medium',startdate:'2019-09-09',enddate:'2019-09-12')
  end
  scenario "Test task list" do

    expect(page).to have_content 'W.H.O'
    expect(page).to have_content 'confort'
    
    visit tasks_path
    save_and_open_page

  end

  scenario "Test task creation" do

    visit new_task_path
    fill_in  'Name' ,  with: 'completed'
    fill_in  'Detail' ,  with: 'ruby task'
    
    click_on  '登録する'

    expect(page).to have_text('Task was successfully created.')
   
  end

  scenario "Test task details" do
    click_on 'Atarashī shigoto'
       fill_in  'Name' ,  with: 'grettings'
       fill_in  'Details' ,  with: 'testtesttest'
       click_on '登録する'
       click_on 'Bakku'
       Task.first

    expect(page).to have_content('grettings')
    expect(page).to have_content('testtesttest')
  end
  scenario "Test task updating" do
    click_on 'Atarashī shigoto'
      fill_in  'Name' ,  with: 'grettings'
      fill_in  'Details' ,  with: 'testtesttest'
      click_on '登録する'
      click_on 'Henshū'
      fill_in  'Name' ,  with: 'hi!'
      fill_in  'Details' ,  with: 'whatsup man'
      click_on '更新する'
      click_on 'Bakku'

    expect(page).to have_content('hi!')
    expect(page).to have_content('whatsup man')
  end

  scenario "Test whether tasks are arranged in descending order of creation date" do
    Task.create(name: 'Added taskname',details:'task details',status:'completed',priority:'low',startdate:'2019-09-10',enddate:'2019-10-23')
    Task.all.order('created_at desc')
    visit tasks_path
    save_and_open_page

   end

  scenario "Test whether tasks are arranged in descending order of end date(deadline)" do
    Task.create(name: 'sorting',details:'everyleaf task',status:'not started',priority:'medium',startdate:'2019-09-12',enddate:'2019-10-09')
    Task.create(name: 'test end date descending',details:'details priority',status:'completed',priority:'low',startdate:'2019-09-12',enddate:'2019-10-09')
    Task.all.order('enddate desc')
    visit tasks_path
  end

  scenario "Test sort in high order by priority" do
    Task.create(name: 'Added name 2',details:'details priority',status:'completed',priority:'low',startdate:'2019-09-12',enddate:'2019-10-09')
    Task.order('priority asc')
  end
  scenario "test if search works" do
    visit tasks_path
    fill_in  'term1' ,  with: 'W.H.O'
    click_on ' Search'
    expect(page).to have_content('W.H.O')
  end
end