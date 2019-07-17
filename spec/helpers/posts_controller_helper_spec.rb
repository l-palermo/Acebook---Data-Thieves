def getId
  user = User.create(name:"test", surname:"test", encrypted_email:"test@test.com", encrypted_password: "123")
  return user.id
end