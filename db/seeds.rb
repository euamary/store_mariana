User.find_or_create_by!(email_address: "voce@example.com") do |user|
  user.password = "senha123"
  user.password_confirmation = "senha123"
end