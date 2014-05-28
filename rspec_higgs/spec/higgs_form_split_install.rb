require_relative '../../lib/main'

describe "Higgs Walkthrough example" do

  before(:all) do
    @higgs = Base.new
    get_test_run_yaml("data/higgs_run_config.yml")
    @url = "https://" + @hostname + ".delivery.puppetlabs.net:3000"
    @higgs.setup(@url)
    create_run_log
    write_test_log('Starting test run')
    OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
  end

  after(:all) do
    write_test_log('Ending test run')
    @higgs.teardown
  end

  ## TODO:  This example breaks the concept of DRY. Need to move resuable steps into helper module and call from tests.
  describe 'Select split install' do

    it 'Enter form We need to know a few things' do
      write_test_log('Fill combined install question form')
      @higgs.page_title_present?('Puppet Enterprise Installer')
      @higgs.link_present?('email the CEO.')
      @higgs.select_link("Let's get started")
      @higgs.page_title_present?('Puppet Enterprise Installer - Choose your deployment')
      @higgs.select_id('combined-description')
      @higgs.enter_text('master_hostname', @hostname)
      @higgs.enter_text('master_alt_names', 'localhost')
      @higgs.enter_text('master_ssh_username','root')
      # @higgs.enter_text('master_sudo_password', 'Puppet11')
      @higgs.enter_text('master_ssh_key_file', '/root/.ssh/id_rsa-acceptance')
      # @higgs.enter_text('master_ssh_key_passphrase', 'Puppet1')
      @higgs.enter_text('console_username','consolesuperuser@email.com')
      @higgs.enter_text('console_password','Puppet11')
      @higgs.enter_text('smtp_hostname',@hostname)
    end

    # # it 'enter form database install' do
    # #   @higgs.select_css("label > label") # <-- select radio button 'Use an existing PostgreSQL instance'
    # #   @higgs.enter_text('database_hostname', 'postgresql_server_dns_name')
    # #   @higgs.enter_text('database_port','8888')
    # #   @higgs.enter_text('puppetdb_database_username','pe-puppetdb_user')
    # #   @higgs.enter_text('puppetdb_database_password','Puppet11')
    # #   @higgs.enter_text('console_database_name','console_database_name')
    # #   @higgs.enter_text('console_database_username', 'console_database_user')
    # #   @higgs.enter_text('console_database_password','console_database_password')
    # #   @higgs.enter_text('console_auth_db_name','console_auth_database_name')
    # #   @higgs.enter_text('console_auth_db_username','console_authdb_user')
    # #   @higgs.enter_text('console_auth_db_password','console_authdb_password')
    # # end

    it 'Enter form more options' do
      @higgs.select_id('smtp_more_options')
      @higgs.enter_text('smtp_port','25')
      @higgs.enter_text('smtp_username','smtpUsername')
      @higgs.enter_text('smtp_password','Puppet11')
    end

    it 'Submit answers' do
      @higgs.select_css('input.btn.btn-default')
    end

    # it 'Submit and go back' do
    #   @higgs.select_id('smtp_more_options')
    #   @higgs.select_css('input.btn.btn-default')
    #   @higgs.select_link('Continue')
    #   @higgs.select_link('Go back')
    # end

    # it 'Deploy Now' do
    #   @higgs.select_link('Continue')
    #   @higgs.select_link('Deploy now')
    # end

  end

end



