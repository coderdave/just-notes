namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    make_admins
    make_users
    make_notes
    # more?
  end
end

# create one admin user
def make_admins
  admin = User.create!(name: "David Sanderson",
                       email: "coderdave@gmail.com",
                       password: "password",
                       password_confirmation: "password")
  admin.toggle!(:admin)
end

# create 10 non-admin users
def make_users
  10.times do |n|
    name = Faker::Name.name
    email = "example-#{n+1}" + "@gmail.com"
    password = "password"
    User.create!(name: name,
                 email: email,
                 password: password,
                 password_confirmation: password)
  end
end

# create 1000 ntoes per user
def make_notes
  User.all.each do |user|
    1000.times do
      title = Populator.words(1..5).titleize
      content = Faker::Lorem.paragraphs(5)
      user.notes.create!(title: title,
                         content: content)
    end
  end
end