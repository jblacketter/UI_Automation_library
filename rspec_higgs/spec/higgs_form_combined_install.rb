require_relative '../../lib/main'
require 'nokogiri'
require 'open-uri'

  describe "Higgs Walkthrough example" do

    before(:all) do
      @higgs = Base.new
      get_test_run_yaml("data/run_config_higgs.yml")
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

    describe 'Create Combined install' do

      it 'Enter form We need to know a few things' do
        write_test_log('Fill combined install question form')
        verify_landing_page
        choose_combined_installer
        form_fill_machine_information
        form_fill_more_options
        click_submit_query
      end

      it 'Verify answer file on host' do
        get_answers_file_blob
      end

      it 'Confirm the plan' do
        @higgs.page_title_present?('Puppet Enterprise Installer - Confirm the plan')
        click_continue
      end

      it 'Deploy Now' do
        click_deploy
      end

    end

  end



