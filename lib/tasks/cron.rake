desc "This task is called by the Heroku cron add-on"
task :cron => :environment do
  #if Time.now.hour == 0 # run at midnight


    # balance points
    User.all.each do |user|
      user.friends.each do |friend|
        if friend.needs_an_interaction? user
          friend.score = friend.score - 1
          friend.save
        end
      end
    end
    
    
  #end
end