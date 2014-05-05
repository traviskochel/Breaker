
User.create do |u|
  u.email = 'travis@scribbletone.com'
  u.first_name = 'Travis'
  u.last_name = 'Kochel'
  u.admin = true
  u.password = 'breakfast'
  u.password_confirmation = 'breakfast'
end