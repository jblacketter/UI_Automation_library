require_relative '../../lib/main'

describe "Higgs Walkthrough example" do

  before(:all) do
    @higgs = Base.new
    @higgs.setup('http://bfywacntd32n15i.delivery.puppetlabs.net:3000/type')
    create_run_log
    write_test_log('Starting test run')
  end

  after(:all) do
    write_test_log('Ending test run')
    @higgs.teardown
  end

  it 'Validate landing page title and elements OLD UI' do
    ### default landing page
    ## @higgs.page_title_present?('Puppetlabs')
    # @higgs.link_present?('email the CEO.')

    ### type landing page - temporary starting point until fix for Lets Begin button
    @higgs.page_title_present?('Choose your deployment')
  end


  # it 'Select Lets Begin' do
  ### TODO: waiting for new build that gives an id to xpath
  ## @higgs.select_id("Let's begin")
  # end

  it 'Select Combined install' do
    @higgs.select_id('combined-description')
  end

  describe 'Radio button check' do
    ## TODO: these ids are recognized and the selection passes but they are not actually selected on screen.
    it 'PuppetDB Select Postgress radio button' do
      @higgs.select_id('database_use_existing')
      @higgs.select_id('database_install_postgres')
    end
  end

  describe 'Enter Form We need some information from you ' do

    it 'Enter form We need to know a few things' do
      write_test_log('Fill out question form')
      @higgs.enter_text('master_hostname', 'master dns')
      @higgs.enter_text('master_alt_names', 'dns_alias')
      @higgs.enter_text('master_ssh_key', 'sshkey')
      @higgs.enter_text('master_ssh_key_passphrase', 'ssh key passphrase')
      @higgs.enter_text('database_hostname', 'postgresql server dns name')
      @higgs.enter_text('database_port','8888')
      @higgs.enter_text('puppetdb_database_user','pe-puppetdb_user')
      @higgs.enter_text('puppetdb_database_password','puppetDB Database password')
      @higgs.enter_text('console_database_name','console_database_name')
      @higgs.enter_text('console_database_user', 'console database user')
      @higgs.enter_text('console_database_user','console_database_user')
      @higgs.enter_text('console_database_password','console_database_password')
      @higgs.enter_text('console_auth_db_name','console authe database name')
      @higgs.enter_text('console_auth_db_user','console authentication database user')
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

  # describe 'Enter Email the ceo' do
  #   # it 'Select Email The CEO' do
  #   # element_present?(:link, "email the CEO.").should be_true
  #   # higgs.select_link('email the CEO')
  #   # end
  # end



end



