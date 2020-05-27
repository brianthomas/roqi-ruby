require 'spec_helper'

describe Subject do

  it 'test basic create' do
    subject = Subject.create :name => 'subject1', :uri => 'uri1'
    assert subject.uri == 'uri1'
    assert subject.valid?
  end

  it 'try to create without uri' do
      subject = Subject.create :name => 'subject2'
      assert subject.valid? != true
  end

  it 'try to create without name' do
      subject = Subject.create :uri => 'uri1'
      assert subject.valid? != true
  end

end
