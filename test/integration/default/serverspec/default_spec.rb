require 'spec_helper'

describe 'test-driven-redis::default' do

  # Serverspec examples can be found at
  # http://serverspec.org/resource_types.html
  describe user('redis') do
    it { should exist }
  end

  describe file('/var/lib/redis') do
    it { should be_directory }
  end

end
