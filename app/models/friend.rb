class Friend < ActiveRecord::Base
  belongs_to :frequency
  belongs_to :user
  has_many :interactions
  
  def needs_an_interaction? user
    interaction = Interaction.where(:user_id => user.id).order(:datetime).last
    return days_since_interaction(interaction, Time.now) > self.frequency.number_of_days 
  end
  
  def seconds_since_interaction interaction, datetime=Time.now
    datetime.to_time.to_i - interaction.datetime.to_time.to_i
  end
  
  def days_since_interaction interaction, datetime=Time.now
    seconds_since_interaction(interaction, datetime) / 86400
  end
  
end
