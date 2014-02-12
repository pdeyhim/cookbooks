require_relative '../../../kitchen/data/spec_helper'

# mesos slave service
describe file('/etc/default/mesos') do
  it { should be_file }
end

describe file('/etc/default/mesos-slave') do
  it { should be_file }
end

describe file('/etc/mesos/zk') do
  it { should be_file }
end

describe 'mesos slave service' do
  it 'should be running' do
    case RSpec.configuration.os
    when 'Debian'
      expect(service 'mesos-slave').to be_running
    end
  end
end

describe port(5051) do
  it { should be_listening }
end
