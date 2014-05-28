require_relative '../../lib/main'
require 'nokogiri'
require 'open-uri'

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
      # @higgs.teardown
    end

    describe 'Create Combined install' do

      it 'Enter form We need to know a few things' do
        write_test_log('Fill combined install question form')
        form_fill_machine_information
        form_fill_more_options
        @higgs.select_css('input.btn.btn-default')
      end

      it 'Verify answer file on host' do
        get_answers_file_blob
      end

      it 'Confirm the plan' do
        @higgs.page_title_present?('Puppet Enterprise Installer - Confirm the plan')
        @higgs.select_link('Continue')
      end

      it 'Deploy Now' do
        @higgs.select_id('deploy-btn')
      end

    end

  end



