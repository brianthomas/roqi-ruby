require 'spec_helper'

describe Capability do

  it 'test basic create' do
    capability = Capability.create :xsi_type => 'conesearch', :standard_id => 'id1'
    assert capability.xsi_type == 'conesearch'
    assert capability.standard_id == 'id1'
    assert capability.valid?
  end

end
