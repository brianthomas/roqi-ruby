class Resource < ActiveRecord::Base
  attr_accessible :name, :title, :identifier
#  has_and_belongs_to_many :subjects, :through => :subjects_resources
  belongs_to :topics
  has_one :capability, :dependent => :destroy

  validates_presence_of :name
  validates_presence_of :identifier

  def topic
    Topic.find self.topic_id
  end

end
