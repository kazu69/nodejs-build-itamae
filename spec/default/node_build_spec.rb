require 'spec_helper'

describe command('source /etc/profile.d/ndenv.sh; which ndenv') do
  its(:stdout) { should match ".ndenv/bin/ndenv" }
end

describe file('/etc/profile.d/ndenv.sh') do
  let(:user) { property['ndenv']['user']}
  let(:ndenv_dir) { property['ndenv']['home'] }
  it { should be_file }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
  it { should be_mode 644 }
  its(:content) { should include("export PATH=\"#{ndenv_dir}/.ndenv/bin:$PATH\"") }
  its(:content) { should include("eval \"$(ndenv init -)\"") }
end

describe file("#{property['ndenv']['home']}/.ndenv/plugins") do
  let(:user) { property['ndenv']['user']}
  it { should be_directory }
  it { should be_owned_by user }
  it { should be_grouped_into user }
  it { should be_mode 755 }
end

describe file("#{property['ndenv']['home']}/.ndenv/plugins/node-build") do
  let(:user) { property['ndenv']['user']}
  it { should be_directory }
  it { should be_owned_by user }
  it { should be_grouped_into user }
  it { should be_mode 755 }
end

%w(v0.12.0 iojs-v1.2.0).each do |version|
  describe command("source /etc/profile.d/ndenv.sh; ndenv versions | grep #{version}") do
    let(:disable_sudo) { true }
    its(:stdout) { should match(version) }
  end
end

describe command('source /etc/profile.d/ndenv.sh; ndenv global') do
  let(:disable_sudo) { true }
  its(:stdout) { should match(/0.12.0/) }
end
