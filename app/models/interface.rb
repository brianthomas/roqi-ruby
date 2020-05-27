class Interface < ActiveRecord::Base
  attr_accessible :query_type, :resource_type, :url, :role, :use, :xsi_type
  belongs_to :capability

  validates_presence_of :url

end
