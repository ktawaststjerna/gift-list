namespace :migrate_pipes do
  desc 'Migrates user to family relationships from Pipe table to UsersToFamilies table'
  task migrate_users_to_families: :environment do
    User.all.each do |user|
      user.families.each do |family|
        UsersToFamilies.find_or_create_by(user: user, family: family)
      end
    end
  end
end
