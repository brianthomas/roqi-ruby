require 'spec_helper'

describe Interface do

  it 'test basic create' do
    iface = Interface.create :xsi_type => 'conesearch', :query_type => 'qtype1', :resource_type => 'rtype1',
       :url => 'url1', :role => 'role1', :use => 'use1'
    assert iface.xsi_type == 'conesearch'
    assert iface.query_type == 'qtype1'
    assert iface.resource_type == 'rtype1'
    assert iface.url == 'url1'
    assert iface.role == 'role1'
    assert iface.use == 'use1'
    assert iface.valid?
  end

  it 'try to create without url' do
    iface = Interface.create :xsi_type => 'type1'
    assert iface.valid? != true
  end

end
