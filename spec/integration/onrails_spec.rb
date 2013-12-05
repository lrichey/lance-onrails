require 'serverspec_helper'

describe "onrails" do
  describe file('/etc/motd') do
    it { should be_a_file }
    it { should contain "Well hello there, Leeroy" }
    it { should contain "Your IP address is 192.168.57.100" }
  end
end
