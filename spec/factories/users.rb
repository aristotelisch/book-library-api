FactoryBot.define do
  factory :user do
    email { "test@example.com" }
    encrypted_password { 'Test1234' }
    password { 'Test1234' }
  end
end
