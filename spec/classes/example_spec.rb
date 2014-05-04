require 'spec_helper'

describe 'magento' do
  context 'supported operating systems' do
    ['Debian', 'RedHat'].each do |osfamily|
      describe "magento class without any parameters on #{osfamily}" do
        let(:params) {{ }}
        let(:facts) {{
          :osfamily => osfamily,
        }}

        it { should compile.with_all_deps }

        it { should contain_class('magento::params') }
        it { should contain_class('magento::install').that_comes_before('magento::config') }
        it { should contain_class('magento::config') }
        it { should contain_class('magento::service').that_subscribes_to('magento::config') }

        it { should contain_service('magento') }
        it { should contain_package('magento').with_ensure('present') }
      end
    end
  end

  context 'unsupported operating system' do
    describe 'magento class without any parameters on Solaris/Nexenta' do
      let(:facts) {{
        :osfamily        => 'Solaris',
        :operatingsystem => 'Nexenta',
      }}

      it { expect { should contain_package('magento') }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end
end
