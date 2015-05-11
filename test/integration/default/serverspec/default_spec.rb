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

  describe port(6379) do
    it { should be_listening }
  end

  describe service('redis6379') do
    it { should be_enabled }
    it { should be_running }
  end

  describe command('/usr/local/bin/redis-cli ping') do
    its(:stdout) { should match('PONG') }
  end

end
