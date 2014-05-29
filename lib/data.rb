require_relative '../lib/main.rb'

module DataGrabber

  def get_test_run_yaml(file)
    @config_data = YAML.load_file("#{file}")
    @hostname = @config_data['test_run_data']['hostname']
    @url = @config_data['test_run_data']['url']
  end

  def get_higgs_test_data_json(file)
    JSON.parse( IO.read(file) )
  end

end