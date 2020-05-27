class Subject < ActiveRecord::Base
  attr_accessible :name, :label, :uri

  has_and_belongs_to_many :topics

  has_many :subclasses, :class_name => "Subject", :foreign_key => 'parent_id'

  validates_presence_of :name
  validates_presence_of :label
  validates_presence_of :uri

end


