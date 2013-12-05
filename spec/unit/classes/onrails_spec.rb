require 'spec_helper'

describe 'onrails', :type => :class do
  let(:facts) {{
      :ipaddress => '192.168.57.100',
  }}

  context 'when include greeter' do
    it {
      should contain_file('/etc/motd')
        .with_ensure('file')
        .with_content(/Well hello there, Leeroy/)
        .with_content(/Your IP address is 192\.168\.57\.100/)
    }
  end

  context 'with :receiver => "Jenkins"' do
    let(:params) {{ :receiver => 'Jenkins' }}
    it {
      should contain_file('/etc/motd')
        .with_ensure('file')
        .with_content(/Well hello there, Jenkins/)
        .with_content(/Your IP address is 192\.168\.57\.100/)
    }
  end

  context 'with :message_type => "bye"' do
    let(:params) {{ :message_type => 'bye' }}
    it {
      should contain_file('/etc/motd')
        .with_ensure('file')
        .with_content(/Well sya later, Leeroy/)
        .with_content(/Your IP address is 192\.168\.57\.100/)
    }
  end
end
