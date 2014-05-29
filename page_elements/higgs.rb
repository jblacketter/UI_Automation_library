require_relative '../lib/main.rb'

module Higgs
##############################################################################################
### predefined clicks
### TODO: These will be generated from a list of attributes using metaprogramming.
##############################################################################################
  def click_machine_information
    @higgs.select_link('Machine Information')
  end
  def click_install_type
    @higgs.select_link('InstallType')
  end
  def click_database_information
    @higgs.select_link('Database Information')
  end
  def click_smtp_info
    @higgs.select_link('SMTP Info')
  end
  def click_misc
    @higgs.select_link('Misc')
  end
  def click_submit_query
    @higgs.select_css('input.btn.btn-default')
  end
  def click_continue
    @higgs.select_link('Continue')
  end
  def click_deploy
    @higgs.select_id('deploy-btn')
  end

##############################################################################################
### Higgs form objects
### TODO: rework this to use json or xml data
##############################################################################################
  def verify_landing_page
    @higgs.page_title_present?('Puppet Enterprise Installer')
    @higgs.link_present?('email the CEO.')
    @higgs.select_link("Let's get started")
    @higgs.page_title_present?('Puppet Enterprise Installer - Choose your deployment')
  end

  def choose_combined_installer
    @higgs.select_id('combined-description')
  end

  def choose_split_installer
    @higgs.select_id('split-description')
  end

  def form_fill_machine_information
    @higgs.enter_text('master_hostname', @hostname)
    @higgs.enter_text('master_alt_names', 'localhost')
    @higgs.enter_text('master_ssh_username','root')
    @higgs.enter_text('master_ssh_key_file', '/root/.ssh/id_rsa-acceptance')
    @higgs.enter_text('console_username','consolesuperuser@email.com')
    @higgs.enter_text('console_password','Puppet11')
    @higgs.enter_text('smtp_hostname',@hostname)
  end

  def form_fill_database_information
    @higgs.enter_text('q_database_host',"#{@database_host}")
    @higgs.enter_text('q_database_port',"#{@database_port}")
    @higgs.enter_text('q_puppet_enterpriseconsole_database_name',"#{@enterpriseconsole_database_name}")
    @higgs.enter_text('q_puppet_enterpriseconsole_database_password',"#{@enterpriseconsole_database_password}")
    @higgs.enter_text('q_puppet_enterpriseconsole_database_password_confirm',"#{@enterpriseconsole_database_password_confirm}")
    @higgs.enter_text('q_puppetdb_database_password',"#{@puppetdb_database_password}")
    @higgs.enter_text('q_puppetdb_database_password_confirm',"#{@puppetdb_database_password_confirm}")
  end

  def form_fill_more_options
    @higgs.select_id('smtp_more_options')
    @higgs.enter_text('smtp_port','25')
    @higgs.enter_text('smtp_username','smtpUsername')
    @higgs.enter_text('smtp_password','Puppet11')
  end

end