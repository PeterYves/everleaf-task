User.create!(name:"cherif",email:"cherif@gmail.com",user_type: "admin",password_digest:"123456")
Label.create!(
    title: "label1",
    content: "content1",
    user_id: 1
  )
  
  Label.create!(
    title: "label3",
    content: "content3",
    user_id: 1
  )
  (4..10).each do |num|                                                    
    Label.create!(title: "label title#{num}", content: "lable content#{num}", user_id: 1)        
  end