require 'serverspec'
require 'net/ssh'
require 'tempfile'
require 'json'

RSpec.configure do |c|
  host = ENV['TARGET_HOST']
  `vagrant up #{host}`
  set_property JSON.parse(File.read("nodes/vagrant.json"))
  set :backend, :ssh
  config = Tempfile.new('', Dir.tmpdir)
  config.write(`vagrant ssh-config #{host}`)
  config.close
  options = Net::SSH::Config.for(host, [config.path])
  options[:user] ||= Etc.getlogin
  set :host,        options[:host_name] || host
  set :ssh_options, options
end
