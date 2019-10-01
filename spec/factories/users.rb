FactoryBot.define do
  factory :user do
    email { "mucyo@gmail.com" }
    password_digest { "123456" }
  end
end
