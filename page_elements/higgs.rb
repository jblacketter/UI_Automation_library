require_relative '../lib/main.rb'

module Higgs

  def click_machine_information
    @higgs.select_link('Machine Information')
  end

  def click_install_type
    @higgs.select_link('InstallType')
  end

  def click_database_information
    @higgs.select_link('Database Information')
  end

  def click_console_information
    @higgs.select_link('Console Information')
  end

  def click_smtp_info
    @higgs.select_link('SMTP Info')
  end

  def click_misc
    @higgs.select_link('Misc')
  end

end
