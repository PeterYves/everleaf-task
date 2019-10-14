FactoryBot.define do
  factory :user do
    name { "mucyo"}
    email { "mucyo@gmail.com" }
    password_digest { "123456" }
  end
end
