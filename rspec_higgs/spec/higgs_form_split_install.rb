require_relative '../../lib/main'

describe "Higgs Walkthrough example" do

  before(:all) do
    @higgs = Base.new
    @higgs.setup('http://f3lpw9dku4xvrj7.delivery.puppetlabs.net:3000/')
    create_run_log
    write_test_log('Starting test run')
  end

  after(:all) do
    write_test_log('Ending test run')
    @higgs.teardown
  end

  describe 'Select split install' do

    it 'Enter form We need to know a few things' do
      write_test_log('Fill combined install question form')
      @higgs.page_title_present?('Puppetlabs')
      @higgs.link_present?('email the CEO.')
      @higgs.select_link("Let's get started")
      @higgs.page_title_present?('Choose your deployment')
      @higgs.select_id('combined-description')
      @higgs.enter_text('master_hostname', 'master dns')
      @higgs.enter_text('master_alt_names', 'dns_alias')
      @higgs.enter_text('master_ssh_key', 'sshkey')
      @higgs.enter_text('master_ssh_key_passphrase', 'ssh key passphrase')
      @higgs.enter_text('database_hostname', 'postgresql server dns name')
      @higgs.enter_text('database_port','8888')
      @higgs.enter_text('puppetdb_database_username','pe-puppetdb_user')
      @higgs.enter_text('puppetdb_database_password','puppetDB Database password')
      @higgs.enter_text('console_database_name','console_database_name')
      @higgs.enter_text('console_database_username', 'console database user')
      @higgs.enter_text('console_database_password','console_database_password')
      @higgs.enter_text('console_auth_db_name','console auth database name')
      @higgs.enter_text('console_auth_db_username','console authentication database user')
      @higgs.enter_text('console_auth_db_password','console authentication database password')
      @higgs.enter_text('console_username','consolesuperuser@email.com')
      @higgs.enter_text('console_password','console_superuser_passphrase')
      @higgs.enter_text('smtp_hostname','smtp_hostname')
    end

    it 'Enter form more options' do
      @higgs.enter_text('smtp_port','smtp_port')
      @higgs.enter_text('smtp_username','smtp_Username')
      @higgs.enter_text('smtp_password','smtpPassword')
    end

    it 'Sumbmit and go back' do
      @higgs.select_id('smtp_more_options')
      @higgs.select_css('input.btn.btn-default')
      @higgs.select_link('Continue')
      @higgs.select_link('Go back')
    end

    it 'Deploy Now' do
      @higgs.select_link('Continue')
      @higgs.select_link('Deploy now')
    end

  end

end



