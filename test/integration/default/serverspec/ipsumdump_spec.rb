require 'serverspec'

# Required by serverspec
set :backend, :exec

## Use Junit formatter output, supported by jenkins
#require 'yarjuf'
#RSpec.configure do |c|
#    c.formatter = 'JUnit'
#end

describe file('/usr/local/bin/ipsumdump') do
  it { should be_file }
  it { should be_executable }
  it { should be_executable.by('owner') }
  it { should be_executable.by('group') }
  it { should be_executable.by('others') }
end

describe command('/usr/local/bin/ipsumdump -h') do
  its(:stdout) { should match /Usage: ipsumdump \[DATA OPTIONS\] \[-i DEVNAMES \| FILES\] > SUMMARYFILE/ }
  its(:stderr) { should_not match /No such file or directory/ }
  its(:exit_status) { should eq 0 }
end
