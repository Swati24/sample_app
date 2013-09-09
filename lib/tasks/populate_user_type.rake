task :populate_user_type => :environment do
  ["Admin", "Editor", "Reporter", "Guest"].each do |name|
    UserType.create(:name => name)
  end
end