namespace :populate do
  desc "Populate 10 Random Users"
  task users: :environment do
  #from populator gem usage docs
  User.populate(10) do |user|
  user.first_name = Faker::Name.first_name
  user.last_name = Faker::Name.last_name
  user.email = Faker::Internet.email
  user.encrypted_password = Faker::Internet.password
  user.reset_password_token = Faker::Time.between(DateTime.now - 1, DateTime.now)
  user.reset_password_sent_at = Faker::Time.backward(18, :evening)
  user.remember_created_at = Faker::Time.backward(14, :evening)
  user.sign_in_count = Faker::Number.between(1, 10)
  user.current_sign_in_at = Faker::Time.between(DateTime.now - 1, DateTime.now)
  user.last_sign_in_at = Faker::Time.backward(14, :evening)
  user.current_sign_in_ip = Faker::Internet.ip_v4_address
  user.last_sign_in_ip = Faker::Internet.ip_v4_address
  end
    puts '10 users populated'
  end

end
