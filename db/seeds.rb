
User.create do |u|
  u.email = 'travis@scribbletone.com'
  u.name_first = 'Travis'
  u.name_last = 'Kochel'
  u.admin = true
  u.password = 'breakfast'
  u.password_confirmation = 'breakfast'
end