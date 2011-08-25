class Friend < ActiveRecord::Base
  
  mount_uploader :portrait, PortraitUploader

  belongs_to :frequency
  belongs_to :user
  has_many :interactions
  
  validates :name, :presence => true, :uniqueness => {:scope => :user_id}
  
  def needs_an_interaction? user, time=Time.now
    interaction = Interaction.where(:user_id => user.id, :friend_id => self.id).order(:datetime).last
    return interaction ? days_since_interaction(interaction, time) > self.frequency.number_of_days : true
  end
  
  def seconds_since_interaction interaction, datetime=Time.now
    datetime.to_time.to_i - interaction.datetime.to_time.to_i
  end
  
  def days_since_interaction interaction, datetime=Time.now
    seconds_since_interaction(interaction, datetime) / 86400
  end
  
  def official_score_alltime
    thescore = 0
    interactions.each do |interaction|
      thescore = thescore + interaction.points + interaction.interaction_type.points
    end
    thescore
  end
  
  def balance_points
    score_alltime = official_score_alltime
    save
  end
  
  def to_param
    self.slug
  end
  
  def slug
    name.gsub(' ', '_')
  end
  
  def self.find_by_slug name_slug
    Friend.find_by_name(name_slug.gsub('_', ' '))
  end
  
  def self.random for_user
    offset = rand(Friend.where(:user_id => for_user.id).count)
    Friend.first(:offset => offset)
  end
  
end
