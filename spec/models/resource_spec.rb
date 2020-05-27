require 'spec_helper'

describe Resource do

  it 'test basic create' do
    resource = Resource.create :name => 'resource1', :identifier => 'id1', :title => 'title1'
    assert resource.identifier == 'id1'
    assert resource.title == 'title1'
    assert resource.name == 'resource1'
    assert resource.valid?
  end

  it 'try to create without identifier' do
      resource = Resource.create :name => 'resource2'
      assert resource.valid? != true
  end

  it 'try to create without name' do
      resource = Resource.create :identifier => 'identifier1'
      assert resource.valid? != true
  end
end
