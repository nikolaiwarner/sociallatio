desc "The daily maintenance updates! This task is called by the Heroku cron add-on"
task :cron => :environment do
  #if Time.now.hour == 0 # run at midnight

    User.all.each do |user|
    
      # balance points
      user.friends.each do |friend|
        if friend.needs_an_interaction? user
          friend.score = friend.score - 1
          friend.save
        end
        
        # Recalculate Points
        friend.balance_points!
        
      end
      
      # email daily status update
      if user.send_daily_email
        UserMailer.status_email(user).deliver
      end    
    end
    
    
    
    
    # Run application backup
    sh "backup perform --trigger heroku --config_file config/backup.rb"
  
    
    
  #end
end