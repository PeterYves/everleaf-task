# In this require, the feature required for Feature Spec such as Capybara are available.
require 'rails_helper'

# On the right side of this RSpec.feature, write the test item name like "task management feature" (grouped by do ~ end)
RSpec.feature "Task management function", type: :feature do
  background do
    FactoryBot.create(:task, name: 'Added name 1')
    FactoryBot.create(:task, name: 'Added name 2')
    FactoryBot.create(:second_task, name: 'Added name 3', details: 'Added content')
  end
  scenario "Test task list" do

  visit tasks_path

  end

  scenario "Test task creation" do

   visit new_task_path
   fill_in  'Name' ,  with: 'completed'
   fill_in  'Detail' ,  with: 'ruby task'
   
   
   click_on  '登録する'

   expect(page).to have_text('Task was successfully created.')
   
  end

  scenario "Test task details" do
    task1=Task.create!(name: 'test_task_03', details: 'samplesample',status: 'completed',priority:'low',startdate:'2019-09-09',enddate:'2019-09-12')
    visit task_path(id: task1.id)

    expect(page).to have_content('test_task_03')
    expect(page).to have_content('samplesample')
  end
  scenario "Test task updating" do
    task1=Task.create!(name: 'test_task_03', details: 'samplesample',status: 'completed',priority:'low',startdate: '2019-09-09',enddate: '2019-09-12')
    visit edit_task_path(id: task1.id)
    fill_in 'Name', with: 'suredeal'
    fill_in 'Detail', with: 'of course'
    # fill_in  'Status' ,  with: 'completed'
    # fill_in  'Priority' ,  with: 'low'
   
    click_on '更新する'
    visit tasks_path
    expect(page).to have_content('suredeal')
    expect(page).to have_content('of course')
  end

  scenario "Test whether tasks are arranged in descending order of creation date" do
    FactoryBot.create(:task, name: 'test creation date descending',details:'details priority',status:'completed',priority:'low',startdate:'2019-09-12',enddate:'2019-10-09')
    Task.all.order('created_at desc')
    visit tasks_path
    save_and_open_page

  end

  scenario "Test whether tasks are arranged in descending order of end date(deadline)" do
    FactoryBot.create(:task, name: 'test end date descending',details:'details priority',status:'completed',priority:'low',startdate:'2019-09-12',enddate:'2019-10-09')
    Task.all.order('enddate desc')
    visit tasks_path
    
    
  end

  scenario "Test sort in high order by priority" do
    FactoryBot.create(:task, name: 'Added name 2',details:'details priority',status:'completed',priority:'low',startdate:'2019-09-12',enddate:'2019-10-09')
    Task.order('priority asc')
  end
end