class Friend < ActiveRecord::Base
  
  mount_uploader :portrait, PortraitUploader

  belongs_to :frequency
  belongs_to :user
  has_many :interactions
  
  validates :name, :presence => true, :uniqueness => true
  
  def needs_an_interaction? user
    interaction = Interaction.where(:user_id => user.id, :friend_id => self.id).order(:datetime).last
    return interaction ? days_since_interaction(interaction, Time.now) > self.frequency.number_of_days : true
  end
  
  def seconds_since_interaction interaction, datetime=Time.now
    datetime.to_time.to_i - interaction.datetime.to_time.to_i
  end
  
  def days_since_interaction interaction, datetime=Time.now
    seconds_since_interaction(interaction, datetime) / 86400
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
  
end
