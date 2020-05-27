class Topic < ActiveRecord::Base
  attr_accessible :name

  has_and_belongs_to_many :subjects
  has_many :resources, :dependent => :destroy

  validates_presence_of :name

end
