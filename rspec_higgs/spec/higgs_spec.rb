require_relative '../../lib/main'

describe 'Enter Higgs questions form' do

  before(:all) do
    @higgs = Base.new
    @higgs.setup('127.0.0.1:9393')
    get_higgs_test_data_yaml('data/higgs_data.yml')
  end
  
  after(:all) do
     @higgs.teardown
  end

    it 'Get Higgs data' do
      get_higgs_test_data_json('data/higgs_data.json')
    end

    it 'Enter Install Type' do
      @higgs.select_id('q_all_in_one_install')
    end

    it 'Enter Machine Information' do
      click_machine_information
      form_fill_machine_information
    end

    it 'Enter Database Information' do
      click_database_information
      @higgs.select_id('q_database_install')
      form_fill_database_information
    end

    it 'Enter Console Information' do
      click_console_information
      form_fill_console_information
    end

    it 'Enter SMTP' do
      click_smtp_info
      form_fill_smtp_info
    end

    it 'Enter Misc' do
      click_misc
      @higgs.select_id('q_puppet_cloud_install')
      @higgs.select_id('q_vendor_packages_install')
      @higgs.select_id('q_pe_check_for_updates')
    end

  end