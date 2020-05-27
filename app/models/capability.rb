class Capability < ActiveRecord::Base
  attr_accessible :xsi_type, :standard_id
  belongs_to :resource
  has_many :interfaces, :dependent => :destroy
end
