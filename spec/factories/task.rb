FactoryBot.define do

    # Name the test data to be created "task"
    # (If you name test data that matches the class name that actually exists, test data of that class will be created automatically)
    factory :task do
      name { 'Default title 1 created by Factory' }
      details { 'Default content 1 created by Factory' }
      status { 'completed' }
      priority { 'low' }
      startdate {'2019-09-10'}
      enddate { '2019-09-20'}
    end
  
    # Name the test data to be created as "second_task"
    # (If you want to name a non-existent class name, optionally specify "Please make test data of this class")
    factory :second_task, class: Task do
      name { 'Default title 2 created by Factory' }
      details { 'Default content 2 created by Factory' }
      status { 'completed' }
      priority { 'low' }
      startdate {'2019-09-08'}
      enddate { '2019-09-19'}
    end
  end