namespace :migrate_pipes do
  desc "TODO"
  task migrate_users_to_families: :environment do
    User.all.each do |user|
      user.families.each do |family|
        UsersToFamilies.find_or_create_by(user: user, family: family)
      end
    end
  end

  desc "TODO"
  task migrate_familes_to_items: :environment do
  end

end
