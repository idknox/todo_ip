def create_user(overrides = {})
  User.create!({
                 name: 'Test User',
                 email: 'test@test.com',
                 password: 'password',
                 password_confirmation: 'password'
               }.merge(overrides))
end

def create_task(overrides = {})
  Task.create!({
                 details: 'Go to the store',
                 due_date: Date.tomorrow,
               }.merge(overrides))
end