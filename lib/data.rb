require_relative '../lib/main.rb'

module DataHandlers

  def get_yaml(file)
    @yaml_data = YAML.load_file("#{file}")
    p @yaml_data.inspect
    # p @puppetmaster_certname = all_data['machine_information']['q_puppetmaster_certname']
  end

end