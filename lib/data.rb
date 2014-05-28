require_relative '../lib/main.rb'

module DataGrabber

  ###
  ## This is a partial experiment in loading data from yaml. this should be replaced by json.  yaml can be used for single configuration files, not for larger sets of test data.
  ###
  # def get_higgs_test_data_yaml(file)
  #   @yaml_data = YAML.load_file("#{file}")
  #   # p @puppetmaster_certname = @yaml_data['machine_information']['q_puppetmaster_certname']
  #   # p @puppetmaster_dnsaltnames = @yaml_data['machine_information']['q_puppetmaster_dnsaltnames']
  #   # p @puppetdb_hostname = @yaml_data['machine_information']['q_puppetdb_hostname']
  #   # p @puppetmaster_enterpriseconsole_hostnamet = @yaml_data['machine_information']['q_puppetmaster_enterpriseconsole_hostname']
  #   # p @database_host = @yaml_data['database_information']['q_database_host']
  #   # p @database_port = @yaml_data['database_information']['q_database_port']
  #   # p @enterpriseconsole_database_name = @yaml_data['database_information']['q_puppet_enterpriseconsole_database_name']
  #   # p @enterpriseconsole_database_password = @yaml_data['database_information']['q_puppet_enterpriseconsole_database_password']
  #   # p @enterpriseconsole_database_password_confirm = @yaml_data['database_information']['q_puppet_enterpriseconsole_database_password_confirm']
  #   # p @puppetdb_database_password = @yaml_data['database_information']['q_puppetdb_database_password']
  #   # p @puppetdb_database_password_confirm = @yaml_data['database_information']['q_puppetdb_database_password_confirm']
  # end

  def get_test_run_yaml(file)
    @config_data = YAML.load_file("#{file}")
    @hostname = @config_data['test_run_data']['hostname']
    @url = @config_data['test_run_data']['url']
  end

  def get_higgs_test_data_json(file)
    JSON.parse( IO.read(file) )
  end



end # TestData_module