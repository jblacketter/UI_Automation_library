require_relative '../../lib/main'

describe 'Enter Higgs questions form' do

  before(:all) do
    @higgs = Base.new
    @higgs.setup('127.0.0.1:9393')
    # TODO: wrap form entry choices into data driven tests using YAML.
    #get_yaml('../data/higgs.yml')
  end
  
  after(:all) do
     @higgs.teardown
  end

    it 'Enter Install Type' do
      @higgs.select_id('q_all_in_one_install')
    end

    it 'Enter Machine Information' do
      click_machine_information
      @higgs.enter_text('q_puppetmaster_certname','certname')
      @higgs.enter_text('q_puppetmaster_dnsaltnames','locahost')
      @higgs.enter_text('q_puppetdb_hostname','locahost')
      @higgs.enter_text('q_puppetmaster_enterpriseconsole_hostname','locahost')
    end

    it 'Enter Database Information' do
      click_database_information
      @higgs.select_id('q_database_install')
      @higgs.enter_text('q_database_host','localhost')
      @higgs.enter_text('q_database_port','console')
      @higgs.enter_text('q_puppet_enterpriseconsole_database_name','console')
      @higgs.enter_text('q_puppet_enterpriseconsole_database_password_confirm','console')
      @higgs.enter_text('q_puppet_enterpriseconsole_database_password','console')
      @higgs.enter_text('q_puppetdb_database_password','console')
      @higgs.enter_text('q_puppetdb_database_password_confirm','console')
    end

    it 'Enter Console Information' do
      click_console_information
      @higgs.enter_text('q_puppet_enterpriseconsole_auth_user_email','admin@example.com')
      @higgs.enter_text('q_puppet_enterpriseconsole_auth_password','Puppet11')
      @higgs.enter_text('q_puppet_enterpriseconsole_auth_password_confirm','Puppet11')
    end

    it 'Enter SMTP' do
      click_smtp_info
      @higgs.enter_text('q_puppet_enterpriseconsole_smtp_host','localhost')
      @higgs.enter_text('q_puppet_enterpriseconsole_smtp_port','25')
      @higgs.select_id('q_puppet_enterpriseconsole_smtp_use_tls')
      @higgs.select_id('q_puppet_enterpriseconsole_smtp_user_auth')
      @higgs.enter_text('q_puppet_enterpriseconsole_smtp_username','console')
      @higgs.enter_text('q_puppet_enterpriseconsole_smtp_password','Puppet11')
      @higgs.enter_text('q_puppet_enterpriseconsole_smtp_password_confirm','Puppet11')
    end

    it 'Enter Misc' do
      click_misc
      @higgs.select_id('q_puppet_cloud_install')
      @higgs.select_id('q_vendor_packages_install')
      @higgs.select_id('q_pe_check_for_updates')
    end

  end