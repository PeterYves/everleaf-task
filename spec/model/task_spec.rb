require 'rails_helper'

RSpec.describe Task, type: :model do

  scenario "Validation does not pass if the name is empty" do
    task = Task.new(name: '', details: 'Failure test')
    expect(task).not_to be_valid
  end

  scenario "Validation does not pass if details is empty" do
    task = Task.new(name: 'welcome', details: '')
    expect(task).not_to be_valid
  end

  scenario "validation does not pass if name and details are empty" do
    task = Task.new(name: '', details: '')
    expect(task).not_to be_valid
  end
  scenario "test if search works" do
    
    Task.all.where('status LIKE ? or name LIKE ?')
  end

end