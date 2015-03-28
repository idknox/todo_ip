def create_user(overrides = {})
  User.create!({
                 name: 'Test User',
                 email: 'test@test.com',
                 password: 'password',
                 password_confirmation: 'password'
               }.merge(overrides))
end